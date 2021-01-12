import Flutter
import UIKit

public class SwiftAudioMetadataPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "audio_metadata", binaryMessenger: registrar.messenger())
        let instance = SwiftAudioMetadataPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "audio_meta":
            guard let args = call.arguments else {
                return
            }
            if let myArgs = args as? [String: Any],
               let filePath = myArgs["file_path"] as? String {
                result(MetaDataManager.getMetaData(filePath: filePath))
            } else {
                result(FlutterError(code: "-1", message: "iOS could not extract " +
                                        "flutter arguments in method: (sendParams)", details: nil))
                break
            }
            
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
