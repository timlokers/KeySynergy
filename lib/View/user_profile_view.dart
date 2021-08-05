import 'package:flutter/material.dart';

import 'Widgets/user_profile_form.dart';


class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Key-Synergy',
            style: TextStyle(color: Color.fromARGB(255, 74, 73, 65)),
          ),
          backgroundColor: const Color.fromARGB(255, 249, 165, 27),
          centerTitle: true,
        ),
        body: const Center(child: UserProfileForm()),
      ),
    );
  }
}
