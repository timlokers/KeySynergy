import 'package:flutter/material.dart';

import 'Widgets/user_profile_form.dart';


class UserProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Key-Synergy',
            style: TextStyle(color: Color.fromARGB(255, 74, 73, 65)),
          ),
          backgroundColor: const Color.fromARGB(255, 249, 165, 27),
          centerTitle: true,
        ),
        body: Container(
          child: UserProfileForm(),
        ),
      ),
    );
  }
}
