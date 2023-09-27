import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  // アプリが起動処理が完了した後によびださせる
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Flutterプラグインを登録し、FlutterとiOSの連携を確立します。
    GeneratedPluginRegistrant.register(with: self)
    setiOSChannel();
    // 親クラスでの処理を実行し、アプリの起動を完了させます。
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func setiOSChannel() {
    // FlutterViewControllerを取得し、FlutterとiOSを結びつけるためのコントローラーを用意します。
    let controller : FlutterViewController = self.window?.rootViewController as! FlutterViewController
    //FlutterMethodChannelを作成し、"com.sample.sample/sample"という名前のFlutterチャネルを設定します。このチャネルはFlutterからiOSに対するメソッドコールをハンドリングします。
    let channel = FlutterMethodChannel.init(name: "com.sample.sample/sample", binaryMessenger: controller.binaryMessenger)
    // channel.setMethodCallHandlerメソッドは、Flutterからのメソッドコールをハンドリングするコールバックを設定します。この場合、"sample"というメソッドが呼ばれたときに、新しいビューコントローラーを起動する処理が行われます。
    channel.setMethodCallHandler({
        (call, result) -> Void in
        if call.method == "sample" {
            let nextController = controller.storyboard?.instantiateViewController(withIdentifier: "SampleViewController")
            controller.present(nextController!, animated: true, completion: nil)
        }
    })
  }

}
