import 'package:flutter/material.dart';
import 'package:key_synergy/Model/user_pofile.dart';

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({Key? key}) : super(key: key);

  @override
  UserProfileFormState createState() {
    return UserProfileFormState();
  }
}

class UserProfileFormState extends State<UserProfileForm> {
  TextEditingController nameInputController = TextEditingController();
  TextEditingController lastnameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();

  final String _phoneId = '';

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
              controller: emailInputController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter your name here',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: SizedBox(
              height: 100.0,
              width: 200.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.save),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
