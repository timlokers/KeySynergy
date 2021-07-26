import 'package:flutter/material.dart';

import 'package:key_synergy/Logic/device_identifier.dart';

class DeviceInfoWidget extends StatefulWidget {
  const DeviceInfoWidget({Key? key}) : super(key: key);

  @override
  _DeviceInfoWidgetState createState() {
    return _DeviceInfoWidgetState();
  }
}

class _DeviceInfoWidgetState extends State<DeviceInfoWidget> {

  Future<String> _deviceIdentifier =  DeviceIdentifier().getDeviceInfo();

  String _identifier;

  _DeviceInfoWidgetState() {
    _deviceIdentifier.then((value) => setState((){
      _identifier = value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
