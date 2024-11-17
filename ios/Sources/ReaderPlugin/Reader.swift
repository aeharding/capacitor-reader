import Foundation
import SafariServices
import UIKit

enum ReaderError: Error {
    case invalidURL
    case invalidColorFormat
    case unsupportedScheme

    var message: String {
        switch self {
        case .invalidURL:
            return "Failed to create URL from provided string"
        case .invalidColorFormat:
            return "Invalid hex color format. Expected format: '#RRGGBB' or '#RRGGBBAA'"
        case .unsupportedScheme:
            return "The specified URL has an unsupported scheme. Only HTTP and HTTPS URLs are supported."
        }
    }
}

@objc public class Reader: NSObject, SFSafariViewControllerDelegate {
    private weak var plugin: ReaderPlugin?

    init(plugin: ReaderPlugin) {
        self.plugin = plugin
        super.init()
    }

    @objc public func open(_ url: String,
                          _ toolbarColor: String?,
                          _ entersReaderIfAvailable: Bool) throws -> SFSafariViewController {
        guard let url = URL(string: url) else {
            throw ReaderError.invalidURL
        }

        guard let scheme = url.scheme?.lowercased(),
              scheme == "http" || scheme == "https" else {
            throw ReaderError.unsupportedScheme
        }

        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = entersReaderIfAvailable

        let safariVC = SFSafariViewController(url: url, configuration: config)
        safariVC.delegate = self

        if let toolbarColor = toolbarColor {
            let color = UIColor(hex: toolbarColor)
            safariVC.preferredBarTintColor = color
        }

        return safariVC
    }

    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        plugin?.notifyListeners("browserFinished", data: [:])
    }
}
