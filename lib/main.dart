import 'package:flutter/material.dart';
import 'View/keylist_view.dart';
import 'package:key_synergy/Logic/Validation/user_profile_validation.dart';
import 'View/user_profile_view.dart';

void main() async{

  /* Default home */
  Widget _defaultHome = KeyListView();

  /* If there is no user profile with current phone id the user will be navigated to the user profile view */
  bool _hasId = await UserProfileValidation().isUserProfileCreated();
  if(_hasId == false){
    _defaultHome = UserProfileView();
  }

  /* Run the app */
  runApp(MaterialApp(
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
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


