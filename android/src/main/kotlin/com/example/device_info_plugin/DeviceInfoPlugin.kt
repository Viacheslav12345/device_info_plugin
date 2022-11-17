package com.example.device_info_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DeviceInfoPlugin */
class DeviceInfoPlugin: FlutterPlugin, MethodCallHandler {

  private lateinit var channel : MethodChannel


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "device_info_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    
if (call.method == "getPlatformVersion") {
  result.success("Android ${android.os.Build.VERSION.RELEASE}")
} else if (call.method == "getBrand") {
  result.success("${android.os.Build.BRAND}")
} else if (call.method == "getModel") {
  result.success("${android.os.Build.MODEL}")
} else if (call.method == "getId") {
  result.success("${android.os.Build.ID}")
}  else if (call.method == "getFingerprint") {
  result.success("${android.os.Build.FINGERPRINT}")
}
else {
  result.notImplemented()
}
}

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
