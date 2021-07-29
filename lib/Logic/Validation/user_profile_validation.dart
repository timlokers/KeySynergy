import 'dart:convert';
import 'package:http/http.dart';
import 'package:key_synergy/Logic/device_info.dart';

class UserProfileValidation {

/* Function to check if a user profile for this 'unique' phone id has been made */
  Future<bool> isUserProfileCreated() async{
    String? deviceId = await DeviceInfo().getDeviceId();

    Response response = await get(Uri.parse('https://tim-lokers.outsystemscloud.com/KeySynergy_API/rest/KeySynergy/GetUserProfileByPhoneId?PhoneId=$deviceId'));
    String data = response.body;
    var decodedData = jsonDecode(data);
    return decodedData;
  }
}
