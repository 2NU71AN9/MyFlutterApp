import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        if let controller = window.rootViewController as? FlutterBinaryMessenger {
            let batteryChannel = FlutterMethodChannel(name: "my.flutter.io/battery", binaryMessenger: controller)
            batteryChannel.setMethodCallHandler { [weak self] call, result in
                if call.method == "getBatteryLevel" {
                    let batteryLevel = self?.getBatteryLevel() ?? -1
                    if batteryLevel == -1 {
                        result(FlutterError(code: "UNAVAILABLE", message: "电池信息不可用", details: nil))
                    } else {
                        result(batteryLevel)
                    }
                } else {
                    result(FlutterMethodNotImplemented)
                }
            }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

extension AppDelegate {
    private func getBatteryLevel() -> Int {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if (device.batteryState == .unknown) {
            return -1
        } else {
            return Int(device.batteryLevel * 100)
        }
    }
}
