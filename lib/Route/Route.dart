import 'package:blog_app/screen/LogInRegistation/LogInPage.dart';
import 'package:blog_app/screen/LogInRegistation/Registation.dart';
import 'package:blog_app/screen/SplashScreen.dart';
import 'package:flutter/material.dart';

const String Main = "Home";
const String SPLASH_SCREEN = "splash_screen";
const String LOGIN = "log_in";
const String REGISTRATION = "registration";

Map<String, WidgetBuilder> appRoutes = {
  SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
  LOGIN: (BuildContext context) => LogInPage(),
  REGISTRATION: (BuildContext context) => Registation(),
};