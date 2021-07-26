import 'dart:io';
import 'package:device_info/device_info.dart';

class DeviceIdentifier {

  Future<String> getDeviceInfo() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId;
    }
  }
}


