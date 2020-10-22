import 'dart:async';

import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Route/RouteTransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SplashProvider with ChangeNotifier {
  BuildContext context;

  SplashProvider() {
    SharedPreferences.getInstance().then((pr) {
      prefs = pr;
    });
    setAppData();
  }

  void setView(BuildContext context) => this.context = context;

  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    //  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    Navigator.of(context).pushReplacementNamed(LOGIN);
  }

  void setAppData() {
    startTime();
  }
}
