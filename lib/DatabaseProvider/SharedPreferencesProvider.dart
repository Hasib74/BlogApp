import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String fingerPrint = "fingurPrint";
String currentUser = "currentUser";

class SharedPreferencesProvider {
  SharedPreferences _sp;

  SharedPreferencesProvider() {
    setUp();
  }

  setUp() async {
    _sp = await SharedPreferences.getInstance();
  }

  storeFingerprint({bool isAuthenticate}) {
    _sp.setBool(fingerPrint, isAuthenticate).then((value) {
      print("Storage value is  ${value}");
    });
  }

  bool getFingerprint() {
    return _sp.get(fingerPrint);
  }

  storeCurrentUser(String number) {
    _sp.setString(currentUser, number);
  }

  String getCurrentUser() {
    print(_sp.getString(currentUser));
    return _sp.getString(currentUser);
  }
}
