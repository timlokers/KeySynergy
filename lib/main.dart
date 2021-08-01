import 'package:flutter/material.dart';
import 'package:key_synergy/View/splash.dart';
import 'View/keylist_view.dart';
import 'View/user_profile_view.dart';

void main() async{

  /* Default home */
  Widget _defaultHome = const Splash();

  /* Run the app */
  runApp(MaterialApp(
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      '/splash': (BuildContext context) => const Splash(),
      '/home': (BuildContext context) => KeyListView(),
      '/userprofile': (BuildContext context) => UserProfileView()
    },
  ));
/*
  void getId() async {
    String? deviceId = await DeviceInfo().getDeviceId();
    print('Id is:' + deviceId!);
  }

  getId();
*/

}


