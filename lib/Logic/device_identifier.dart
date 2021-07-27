import 'dart:developer';
import 'dart:io';
import 'package:device_info/device_info.dart';

class DeviceIdentifier {
  DeviceInfoPlugin deviceId = DeviceInfoPlugin();

  Future<String> getDeviceId() async{

    String deviceInfo = '';

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceId.androidInfo;
        deviceInfo = androidInfo.id;
        log(deviceInfo);
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceId.iosInfo;
        deviceInfo = iosInfo.identifierForVendor;
        log(deviceInfo);
      }
    }
    catch (e){
      throw Exception(e);
    }
    return deviceInfo;
    }
  }

