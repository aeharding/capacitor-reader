import Foundation
import SafariServices
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

    private var safariViewController: SFSafariViewController?

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
                self.safariViewController = safariVC
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

    public override func shouldOverrideLoad(_ navigationAction: WKNavigationAction) -> NSNumber? {
        // If the web view reloads/changes route, immediately close the safari view controller
        //
        // Overwise user could return to app and see correctly loaded last opened SFSafariViewController,
        // but when they press done they see the app startup (WKWebView/Capacitor doesn't safe app state)
        closeIfNeeded()

        return nil;
    }

    func closeIfNeeded() {
        if let safariVC = safariViewController {
            safariVC.dismiss(animated: false, completion: nil)
            safariViewController = nil
        }
    }
}
