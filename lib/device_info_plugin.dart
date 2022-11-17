import 'device_info_plugin_platform_interface.dart';

class DeviceInfoPlugin {
  Future<String?> getPlatformVersion() {
    return DeviceInfoPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getBrand() {
    return DeviceInfoPluginPlatform.instance.getBrand();
  }

  Future<String?> getModel() {
    return DeviceInfoPluginPlatform.instance.getModel();
  }

  Future<String?> getId() {
    return DeviceInfoPluginPlatform.instance.getId();
  }

  Future<String?> getFingerprint() {
    return DeviceInfoPluginPlatform.instance.getFingerprint();
  }
}
