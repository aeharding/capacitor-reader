import Foundation
import SafariServices
import UIKit

@objc public class Reader: NSObject {
    @objc public func open(_ url: String, _ toolbarColor: String?, _ entersReaderIfAvailable: Bool) -> SFSafariViewController? {
        if let url = URL(string: url) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = entersReaderIfAvailable
            
            let safariVC = SFSafariViewController(url: url, configuration: config)
            if let toolbarColor = toolbarColor {
                safariVC.preferredBarTintColor = UIColor(hex: toolbarColor)
            }

            return safariVC
        }

        return nil;
    }
}
