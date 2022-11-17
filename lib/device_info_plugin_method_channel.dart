import 'package:flutter/services.dart';

import 'device_info_plugin_platform_interface.dart';

/// An implementation of [DeviceInfoPluginPlatform] that uses method channels.
class MethodChannelDeviceInfoPlugin extends DeviceInfoPluginPlatform {
  /// The method channel used to interact with the native platform.
  // @visibleForTesting
  final methodChannel = const MethodChannel('device_info_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getBrand() async {
    final brand = await methodChannel.invokeMethod<String>('getBrand');
    return brand;
  }

  @override
  Future<String?> getModel() async {
    final model = await methodChannel.invokeMethod<String>('getModel');
    return model;
  }

  @override
  Future<String?> getId() async {
    final id = await methodChannel.invokeMethod<String>('getId');
    return id;
  }

  @override
  Future<String?> getFingerprint() async {
    final fingerprint =
        await methodChannel.invokeMethod<String>('getFingerprint');
    return fingerprint;
  }
}
