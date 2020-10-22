import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/AppHelper/AppConstant.dart';
import 'package:blog_app/AppHelper/Dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


AppTheme() {
  return ThemeData(
    primaryColor: AppColors.Primary_Lite,
    accentColor: AppColors.Primary_Accent,
    primaryColorDark: AppColors.Primary,
    primaryColorLight: AppColors.Primary_Lite,
    scaffoldBackgroundColor: AppColors.Background,
    appBarTheme: AppBarTheme(color: AppColors.Primary),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Big,
            fontWeight: FontWeight.w800),
        headline2: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Big,
            fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size,
            fontWeight: FontWeight.normal),
        bodyText2: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Small,
            fontWeight: FontWeight.normal),
        headline6: TextStyle(
            color: AppColors.Text_Color,
            fontSize: Dimension.Text_Size_Small_Extra,
            fontWeight: FontWeight.normal)),
    /*pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: RouteTransition(),
      TargetPlatform.android: RouteTransition()
    }),*/

  );
}
