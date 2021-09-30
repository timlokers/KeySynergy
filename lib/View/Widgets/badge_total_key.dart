import 'package:flutter/material.dart';
import 'package:key_synergy/API/key_synergy_api.dart';

class BadgeTotalKey extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BadgeTotalKeyState();
  }
}

class BadgeTotalKeyState extends State<BadgeTotalKey> {

  String _totalKeys = '';

  BadgeTotalKeyState(){
      getTotal().then((value) =>
      _totalKeys = value
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 30.0,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              5.0, //move to right
              3.0, //move to bottom
            ),
          ),
        ],
      ),
      child: Text(
        _totalKeys,
        style: const TextStyle(
          color: Color.fromARGB(255, 74, 73, 65),
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<String> getTotal() async{
    return await KeySynergyAPI().getTotalUnusedKeys();
  }
}


