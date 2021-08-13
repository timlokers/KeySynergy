import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:key_synergy/Model/user_pofile.dart';

class KeySynergyAPI {
  Future<List<UserProfile>> getUserProfiles() async {
    String url =
        'https://tim-lokers.outsystemscloud.com/KeySynergy_API/rest/KeySynergy/GetUserProfiles';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => UserProfile.fromJson(data)).toList();
    } else {
      throw Exception();
    }
  }

  Future<UserProfile> createUserProfile(int id, String name, String lastname,
      String email, String? phoneId) async {
    String url =
        'https://tim-lokers.outsystemscloud.com/KeySynergy_API/rest/KeySynergy/PostUserProfile';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'Id': id,
        'Name': name,
        'Lastname': lastname,
        'Email': email,
        'PhoneId': phoneId,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create a user profile');
    }
  }

  Future<String?> linkKeyWithUserProfile(String deviceId, String keyId) async {
    String url =
        'https://tim-lokers.outsystemscloud.com/KeySynergy_API/rest/KeySynergy/LinkKeyWithUserProfile';

    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'KeyId': keyId,
          'PhoneId': deviceId,
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to create a user profile');
    }
  }

  Future<Map<dynamic, dynamic>> hasUserProfileKey(int userProfileId, String phoneId) async {
    String url = 'https://tim-lokers.outsystemscloud.com/KeySynergy_API/rest/KeySynergy/UserProfileHasKey?UserProfileId=$userProfileId&PhoneId=$phoneId';


    final response = await http.get(Uri.parse(url));

    if(response == 200){
      List jsonResponse = jsonDecode(response.body);
      var keyData = Map.fromEntries(jsonResponse.map((result) => MapEntry(result['HasKey'], result['IsKeyOwner'])));

      return keyData;
    }
    else {
      throw Exception();
    }

  }
}
