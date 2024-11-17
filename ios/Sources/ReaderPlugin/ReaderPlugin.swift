import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ReaderPlugin)
public class ReaderPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "ReaderPlugin"
    public let jsName = "Reader"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "open", returnType: CAPPluginReturnPromise)
    ]
    private lazy var implementation: Reader = {
        return Reader(plugin: self)
    }()

    @objc func open(_ call: CAPPluginCall) {
        guard let url = call.getString("url") else {
            call.reject("URL parameter is required")
            return
        }

        let toolbarColor = call.getString("toolbarColor")
        let entersReaderIfAvailable = call.getBool("entersReaderIfAvailable") ?? false

        do {
            if let viewController = bridge?.viewController {
                let safariVC = try implementation.open(url, toolbarColor, entersReaderIfAvailable)
                DispatchQueue.main.async {
                    viewController.present(safariVC, animated: true) {
                        call.resolve()
                    }
                }
                return
            }
            call.reject("No view controller available")
        } catch let error as ReaderError {
            call.reject(error.message)
        } catch {
            call.reject("Unknown error occurred: \(error.localizedDescription)")
        }
    }
}
