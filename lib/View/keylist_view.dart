import 'package:flutter/material.dart';

import 'Widgets/key_list_container.dart';

class KeyListView extends StatelessWidget {

  final KeyListContainer _keyListContainer = KeyListContainer();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Key-Synergy',
              style: TextStyle(color: Color.fromARGB(255, 74, 73, 65)),
            ),
            backgroundColor: Color.fromARGB(255, 249, 165, 27),
            centerTitle: true,
          ),
          body: _keyListContainer,
    )
    ,
    );
  }
}
