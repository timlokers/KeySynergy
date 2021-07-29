/* Flutter import */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* API import */
import 'package:key_synergy/API/key_synergy_api.dart';

/* Model import */
import 'package:key_synergy/Model/user_pofile.dart';

class KeyListContainer extends StatelessWidget {
  final KeySynergyAPI _KeySynergyAPI = KeySynergyAPI();

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
