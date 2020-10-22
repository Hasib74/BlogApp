import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Route/RouteTransition.dart';
import 'package:blog_app/screen/LogInRegistation/LogInPage.dart';
import 'package:flutter/material.dart';

onGenaratedRoute(RouteSettings routeSettings) {
  if (routeSettings.name == LOGIN) {
    return CustomRoute(
      builder: appRoutes[LOGIN],
    );
  } else if (routeSettings.name == SPLASH_SCREEN) {
    return CustomRoute(
      builder: appRoutes[SPLASH_SCREEN],
    );
  } else if (routeSettings.name == REGISTRATION) {
    return CustomRoute(builder: appRoutes[REGISTRATION]);
  }
}
