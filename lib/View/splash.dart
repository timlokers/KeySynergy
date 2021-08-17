import 'package:flutter/material.dart';
import 'package:key_synergy/Logic/Validation/user_profile_validation.dart';
import 'package:key_synergy/Logic/device_info.dart';

import 'keylist_view.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late bool _isCreated;

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    String? deviceId = await DeviceInfo().getDeviceId();
    _isCreated = await UserProfileValidation().isUserProfileCreated(deviceId);
    if (_isCreated) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(settings: const RouteSettings(name: '/home'), builder: (context) => KeyListView(deviceId!)));
    } else {
      Navigator.pushReplacementNamed(context, '/userprofile');
    }
    await Future.delayed(const Duration(milliseconds: 2000), () async {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SizedBox(
        height: 150.0,
        width: 150.0,
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 249, 165, 27),
          strokeWidth: 10.0,
        ),
      )),
    );
  }
}
