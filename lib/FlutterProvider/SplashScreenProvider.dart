import 'dart:async';

import 'package:blog_app/AppHelper/AppDataHelper.dart';
import 'package:blog_app/DatabaseProvider/SharedPreferencesProvider.dart';
import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Route/RouteTransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SplashProvider with ChangeNotifier {
  BuildContext context;
  SharedPreferencesProvider sharedPreferencesProvider;

  SplashProvider() {
    setAppData();
  }

  void setView(BuildContext context) {
    this.context = context;
    sharedPreferencesProvider = Provider.of<SharedPreferencesProvider>(context);
  }

  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    //  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    //print(sharedPreferencesProvider.getCurrentUser());

    if (sharedPreferencesProvider.getCurrentUser() == null) {
      Navigator.of(context).pushReplacementNamed(LOGIN);
    } else {
      AppDataHelper.current_user = sharedPreferencesProvider.getCurrentUser();

      Navigator.of(context).pushReplacementNamed(DISPLAY);
    }
  }

  void setAppData() {
    startTime();
  }
}
