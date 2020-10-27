import 'package:animations/animations.dart';
import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/AppHelper/AppSpaces.dart';
import 'package:blog_app/AppHelper/AppStyle.dart';
import 'package:blog_app/DatabaseProvider/SharedPreferencesProvider.dart';
import 'package:blog_app/FlutterProvider/SplashScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class SplashScreen extends StatelessWidget {
  double opcaity = 0.0;

  SplashProvider splashProvider;
  SharedPreferencesProvider sharedPreferencesProvider;

  @override
  Widget build(BuildContext context) {
    mainWidth = MediaQuery.of(context).size.width;
    mainHeight = MediaQuery.of(context).size.height;

    splashProvider = Provider.of<SplashProvider>(context)..setView(context);
    sharedPreferencesProvider = Provider.of<SharedPreferencesProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.Primary,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              curve: Curves.bounceInOut,
              duration: Duration(seconds: 3),
              opacity: 1,
              child: coloredText("B", Colors.black),
            ),
            AppSpaces.spaces_width_5,
            AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: 1,
              child: coloredText("L", Colors.red),
            ),
            AppSpaces.spaces_width_5,
            AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: 1,
              child: coloredText("O", Colors.orange),
            ),
            AppSpaces.spaces_width_5,
            AnimatedOpacity(
                duration: Duration(seconds: 3),
                opacity: 1,
                child: coloredText("C", Colors.green)),
            AppSpaces.spaces_width_5,
            AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: 1,
              child: coloredText("G", Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  coloredText(String title, Color color) {
    return Text("${title}",
        style: AppStyle.header_extra_bold(
            color: color, fontWeight: FontWeight.w900, text_size: 30));
  }
}
