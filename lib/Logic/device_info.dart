import 'dart:io';
import 'package:device_info/device_info.dart';

class DeviceInfo {

  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceId = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceId.androidInfo;
        return androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceId.iosInfo;
        return iosInfo.identifierForVendor;
      }
    }
    catch (e) {
      throw Exception(e);
    }
  }
}
