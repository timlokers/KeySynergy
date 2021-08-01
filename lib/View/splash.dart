import 'package:flutter/material.dart';
import 'package:key_synergy/Logic/Validation/user_profile_validation.dart';

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
    _isCreated = await UserProfileValidation().isUserProfileCreated();
    if (_isCreated) {
      Navigator.pushReplacementNamed(context, '/home');
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
