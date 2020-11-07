import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Route/RouteTransition.dart';
import 'package:blog_app/Screen/Display/DisplayPost.dart';
import 'package:blog_app/Screen/Display/Home.dart';
import 'package:blog_app/Screen/Display/app_display.dart';

import 'package:blog_app/Screen/LogInRegistation/FaceRecognization.dart';
import 'package:blog_app/Screen/LogInRegistation/LogInPage.dart';
import 'package:blog_app/Screen/LogInRegistation/OtpScreen.dart';
import 'package:blog_app/Screen/LogInRegistation/Registation.dart';
import 'package:blog_app/Screen/SplashScreen.dart';
import 'package:blog_app/Widgets/LargeDialogWidget.dart';
import 'package:flutter/material.dart';

Route onGenaratedRoute(RouteSettings routeSettings) {
  if (routeSettings.name == LOGIN) {
    return CustomPageRoute(
      LogInPage(),
    );
  } else if (routeSettings.name == SPLASH_SCREEN) {
    return CustomPageRoute(
      SplashScreen(),
    );
  } else if (routeSettings.name == REGISTRATION) {
    return CustomPageRoute(Registation());
  } else if (routeSettings.name == FACE_RECOGNITION) {
    return CustomPageRoute(FaceRecognization());
  } else if (routeSettings.name == OTP_SCREEN) {
    return CustomPageRoute(OtpPage(
      screenArguments: routeSettings.arguments,
    ));
  } else if (routeSettings.name == DISPLAY) {
    return CustomPageRoute(AppDisplay());
  } else if (routeSettings.name == POST_DISPLAY) {
    return CustomPageRoute(DisplayPost(
      screenArguments: routeSettings.arguments,
    ));
  }
}
