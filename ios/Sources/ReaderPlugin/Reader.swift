import Foundation
import SafariServices
import UIKit

@objc public class Reader: NSObject {
    @objc public func open(_ url: String, _ toolbarColor: String?, _ entersReaderIfAvailable: Bool) -> String {
        if let url = URL(string: url),
           let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let topViewController = scene.windows.first?.rootViewController {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = entersReaderIfAvailable
            
            let safariVC = SFSafariViewController(url: url, configuration: config)
            if let toolbarColor = toolbarColor {
                safariVC.preferredBarTintColor = UIColor(hex: toolbarColor)
            }
            
            DispatchQueue.main.async {
                topViewController.present(safariVC, animated: true)
            }
        }
        
        return url
    }
}
