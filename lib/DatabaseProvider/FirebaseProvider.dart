import 'package:blog_app/AppHelper/AppDataHelper.dart';
import 'package:blog_app/DatabaseProvider/DatabaseKeyName.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  DatabaseKeyName dkn;

  Future<bool> registration({name, email, nid, number}) async {
    print("Name is  :  ${name}");
    print("email is  :  ${email}");
    print("nid is  :  ${nid}");
    print("number is  :  ${number}");

    bool registrationSuccess = false;

    await FirebaseDatabase.instance
        .reference()
        .child(DatabaseKeyName.child_user)
        .child(number)
        .set({
      DatabaseKeyName.name: name,
      DatabaseKeyName.email: email,
      DatabaseKeyName.nid: nid,
    }).then((value) {
      registrationSuccess = true;
    });

    return registrationSuccess;
  }
}
