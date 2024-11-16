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
    private let implementation = Reader()

    @objc func open(_ call: CAPPluginCall) {
        let url = call.getString("url") ?? ""
        let toolbarColor = call.getString("toolbarColor")
        let entersReaderIfAvailable = call.getBool("entersReaderIfAvailable") ?? false

        if let viewController = bridge?.viewController, let safariVC = implementation.open(url, toolbarColor, entersReaderIfAvailable) {
            DispatchQueue.main.async {
                viewController.present(safariVC, animated: true) {
                    call.resolve()
                }
            }
            return
        }

        call.reject("failed to present SafariVC")
    }
}
