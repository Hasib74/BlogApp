import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Route/RouteTransition.dart';
import 'package:blog_app/screen/LogInRegistation/LogInPage.dart';
import 'package:flutter/material.dart';

Route onGenaratedRoute(RouteSettings routeSettings) {
  if (routeSettings.name == LOGIN) {
    print("LogIn  ");
    return CustomPageRoute(
      appRoutes[LOGIN],
    );
  } else if (routeSettings.name == SPLASH_SCREEN) {
    print("Splash Screen  ");
    return CustomPageRoute(
      appRoutes[SPLASH_SCREEN],
    );
  } else if (routeSettings.name == REGISTRATION) {
    print("Registation ");
    return CustomPageRoute(appRoutes[REGISTRATION]);
  }
}
