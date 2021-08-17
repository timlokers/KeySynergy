import 'package:flutter/material.dart';

class KeyIcon extends StatefulWidget {
  bool hasKey;
  String phoneId;
  String phoneIdUserProfile;

  KeyIcon(this.hasKey, this.phoneId, this.phoneIdUserProfile, {Key? key}) : super(key: key);

  @override
  KeyIconState createState() {
    return KeyIconState();
  }
}

class KeyIconState extends State<KeyIcon> {

  @override
  Widget build(BuildContext context)
  {

    if(widget.hasKey){
      if(widget.phoneId == widget.phoneIdUserProfile){
        return const Icon(
          Icons.delete_forever_outlined,
          color: Color.fromARGB(255, 249, 165, 27),
        );
      }
      return const Icon(
        Icons.vpn_key,
        color: Color.fromARGB(255, 249, 165, 27),
      );
    }
    return const Text('');

  }

}



