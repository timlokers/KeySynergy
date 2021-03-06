import 'package:flutter/material.dart';

import 'Widgets/badge_total_key.dart';
import 'Widgets/key_list_container.dart';

class KeyListView extends StatelessWidget {
  String deviceId;

  KeyListView(this.deviceId, {Key? key}) : super(key: key);

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
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
              child: BadgeTotalKey(),
            ),
          ],
        ),
        body: KeyListContainer(deviceId),
      ),
    );
  }
}
