import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:key_synergy/Model/user_pofile.dart';

class KeyAPI {
  Future<UserProfile> getUserProfiles() async {
    String url =
        'https://tim-lokers.outsystemscloud.com/KeySynergy_API/rest/KeySynergy/GetKeys';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> userProfileResponse = jsonDecode(response.body);
      return UserProfile.fromJson(userProfileResponse);
    } else {
      throw Exception();
    }
  }
}
