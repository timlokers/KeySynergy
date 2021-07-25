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

}
