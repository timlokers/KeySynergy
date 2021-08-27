import 'package:flutter/material.dart';

class KeyIcon extends StatefulWidget {
  bool hasKey;
  String phoneId;
  String phoneIdUserProfile;

  KeyIcon(this.hasKey, this.phoneId, this.phoneIdUserProfile, {Key? key})
      : super(key: key);

  @override
  KeyIconState createState() {
    return KeyIconState();
  }
}

class KeyIconState extends State<KeyIcon> {
  @override
  Widget build(BuildContext context) {
    if (widget.hasKey) {
      if (widget.phoneId == widget.phoneIdUserProfile) {
        return Container(
          width: 50.0,
          child: Stack(
            children: const [
              Icon(
                Icons.vpn_key,
                color: Color.fromARGB(255, 249, 165, 27),
              ),
              Positioned(
                left: 3.0,
                bottom: -3.0,
                child: Icon(
                  Icons.close_sharp,
                  size: 30.0,
                  color: Color.fromARGB(155, 255, 38, 0),
                ),
              ),
            ],
          ),
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
