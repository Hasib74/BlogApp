import 'package:blog_app/DatabaseProvider/SharedPreferencesProvider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isFingerPrint;

  bool get isFingerPrint => _isFingerPrint;

  BuildContext context;
  SharedPreferencesProvider sharedPreferencesProvider;

  setView({context}) {
    print("Set View");
    this.context = context;
    sharedPreferencesProvider = SharedPreferencesProvider();
  }

  setFingerPrintAuthentication({bool isAuthenticate}) {
    sharedPreferencesProvider.storeFingerprint(isAuthenticate: isAuthenticate);
  }

  IsFingerPrintAuthentication() {
    _isFingerPrint = sharedPreferencesProvider.getFingerprint();
  }
}
