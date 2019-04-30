import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
	let viewFactory = VideoViewFactory()
	registrar(forPlugin: "boxue-video").register(viewFactory, withId: "VideoView")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
