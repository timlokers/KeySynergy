import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_synergy/Logic/device_info.dart';
import 'package:key_synergy/API/key_synergy_api.dart';
import '../keylist_view.dart';

DeviceInfo deviceInfo = DeviceInfo();

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({Key? key}) : super(key: key);

  @override
  UserProfileFormState createState() {
    return UserProfileFormState();
  }
}

class UserProfileFormState extends State<UserProfileForm> {
  String? _phoneId = '';

  UserProfileFormState() {
    getPhoneId().then((value) =>
        setState(() {
          _phoneId = value;
        }));
  }

  TextEditingController nameInputController = TextEditingController();
  TextEditingController lastnameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: Column(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            alignment: Alignment.center,
            child: TextField(
              controller: nameInputController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Enter your name here',
              ),
            ),
          ),
          Container(
            height: 100.0,
            width: double.infinity,
            alignment: Alignment.center,
            child: TextField(
              controller: lastnameInputController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Enter your lastname here',
              ),
            ),
          ),
          Container(
            height: 100.0,
            width: double.infinity,
            alignment: Alignment.center,
            child: TextField(
              controller: emailInputController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email here',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: SizedBox(
              height: 100.0,
              width: 200.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 249, 165, 27),
                ),
                onPressed: () {
                  KeySynergyAPI().createUserProfile(
                      0,
                      nameInputController.text,
                      lastnameInputController.text,
                      emailInputController.text,
                      _phoneId);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => KeyListView(_phoneId!)));
                },
                child: const Icon(Icons.save),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> getPhoneId() async {
    return await deviceInfo.getDeviceId();
  }
}
