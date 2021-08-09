import 'dart:convert';

import 'package:key_synergy/API/key_synergy_api.dart';
import 'package:nfc_manager/nfc_manager.dart';

import 'device_info.dart';

class NfcHandler {
  Future<String?> tagRead() async {
    String nfcKey = '';

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      var record = ndef!.cachedMessage!.records.first;
      var decodedRecord = utf8.decode(record.payload);
      nfcKey = decodedRecord.substring(3);
    });

    return nfcKey;
  }

  void setNfcKey(String? keyId) async {
    String? _deviceId = await DeviceInfo().getDeviceId();

    KeySynergyAPI().linkKeyWithUserProfile(_deviceId!, keyId!);

    print('gedaan!');
  }
}
