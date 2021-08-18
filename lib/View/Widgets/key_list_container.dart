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

/*Widget import*/
import 'key_icon.dart';

class KeyListContainer extends StatefulWidget {
  String deviceId;

  KeyListContainer(this.deviceId);

  @override
  State<KeyListContainer> createState() => _KeyListContainerState();
}

class _KeyListContainerState extends State<KeyListContainer> {
  final KeySynergyAPI _KeySynergyAPI = KeySynergyAPI();

  _KeyListContainerState() {
    tagRead();
  }

  _refreshUserProfiles(BuildContext context) async {
    setState(() {
      _KeySynergyAPI.getUserProfiles();
    });
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
                  return Card(
                    margin: const EdgeInsets.fromLTRB(4.0, 3.0, 10.0, 3.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.account_circle_rounded,
                            size: 55.0,
                          ),
                          title: Container(
                            padding: const EdgeInsets.all(8.00),
                            child: Text(
                                data[index].name + ' ' + data[index].lastname),
                          ),
                          subtitle: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.fromLTRB(
                                0.00, 00.00, 0.00, 0.00),
                            child: IconButton(
                              icon: KeyIcon(data[index].hasKey,
                                  data[index].phoneId!, widget.deviceId),
                              onPressed: () {
                                if (data[index].hasKey == true ||
                                    data[index].phoneId! == widget.deviceId) {
                                  KeySynergyAPI()
                                      .removeKeyFromUser(data[index].id);
                                  _refreshUserProfiles(context);
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const Text('');
          }
        });
  }

  void tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      var record = ndef!.cachedMessage!.records.first;
      var decodedRecord = utf8.decode(record.payload);

      await Future.delayed(const Duration(milliseconds: 500), () {
        NfcHandler().setNfcKey(decodedRecord.substring(3));
        Future.delayed(const Duration(milliseconds: 250), () {
          _refreshUserProfiles(context);
          _showSnackbar(context);
        });
      });
    });
  }

  void _showSnackbar(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        width: 300.0,
        backgroundColor: Color.fromARGB(191, 129, 209, 176),
        duration: Duration(seconds: 4),
        content: Text(
          'You got the key for the 7 gates of hell!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
