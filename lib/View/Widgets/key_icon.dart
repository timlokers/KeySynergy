import 'package:flutter/material.dart';
import 'package:key_synergy/API/key_synergy_api.dart';

class KeyIcon extends StatefulWidget {
  bool hasKey;

  KeyIcon(this.hasKey, {Key? key}) : super(key: key);

  @override
  KeyIconState createState() {
    return KeyIconState();
  }
}

class KeyIconState extends State<KeyIcon> {

  @override
  Widget build(BuildContext context) {

    if(widget.hasKey){
      return const Icon(
      Icons.vpn_key,
      color: Color.fromARGB(255, 249, 165, 27),
    );
    }
    else{
      return Container(
        child: const Text(''),
      );
    }
  }
}

