import 'package:flutter/material.dart';
import 'package:key_synergy/API/key_synergy_api.dart';
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
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                          title: Text(data[index].name + ' ' + data[index].lastname),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          else{
           return const Text('');
          }
        });
  }
}
