import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)

      let controller = window?.rootViewController as! FlutterViewController
      let channel = FlutterMethodChannel(name: "my_flutter_app/channel",
                                         binaryMessenger: controller.binaryMessenger)

      channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
          if call.method == "openExternalBrowser" {
              if let args = call.arguments as? [String: Any],
                 let url = args["url"] as? String {
                  let success = SwiftFunctions.openExternalBrowser(urlString: url)
                  success ? result(nil) : result(FlutterError(code: "INVALID_URL",
                                                              message: "Cannot open URL",
                                                              details: nil))
              } else {
                  result(FlutterError(code: "INVALID_ARGUMENTS",
                                      message: "URL not provided",
                                      details: nil))
              }
          } else {
              result(FlutterMethodNotImplemented)
          }
      }

      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


class SwiftFunctions {
    static func openExternalBrowser(urlString: String) -> Bool {
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else {
            return false // Invalid URL or cannot open
        }
        DispatchQueue.main.async {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        return true
    }
}
