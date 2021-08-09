/* Flutter import */
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* API import */
import 'package:key_synergy/API/key_synergy_api.dart';
import 'package:key_synergy/Logic/nfc_handler.dart';

/* Model import */
import 'package:key_synergy/Model/user_pofile.dart';
import 'package:nfc_manager/nfc_manager.dart';

class KeyListContainer extends StatefulWidget {
  @override
  State<KeyListContainer> createState() => _KeyListContainerState();
}

class _KeyListContainerState extends State<KeyListContainer> {
  final KeySynergyAPI _KeySynergyAPI = KeySynergyAPI();

   _KeyListContainerState(){
     tagRead();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserProfile>>(
        future: _KeySynergyAPI.getUserProfiles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserProfile>? data = snapshot.data;
            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(5.00),
                        leading: const Icon(
                          Icons.account_circle_rounded,
                          size: 55.0,
                        ),
                        title: Container(
                          padding: const EdgeInsets.all(15.00),
                          child: Text(
                              data[index].name + ' ' + data[index].lastname),
                        ),
                        subtitle: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.fromLTRB(
                              15.00, 00.00, 0.00, 0.00),
                          child: const Icon(
                            Icons.vpn_key,
                            color: Color.fromARGB(255, 249, 165, 27),
                          ),
                        ),
                      ),
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide())));
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const Text('');
          }
        });
  }
}

void tagRead() {
  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async{
    var ndef = Ndef.from(tag);
    var record = ndef!.cachedMessage!.records.first;
    var decodedRecord = utf8.decode(record.payload);

    await Future.delayed(const Duration(milliseconds: 500), (){
      NfcHandler().setNfcKey(decodedRecord.substring(3));
    });

  });
}
