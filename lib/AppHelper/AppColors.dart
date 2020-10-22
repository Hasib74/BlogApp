import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static Color Primary = Colors.white;
  static Color Primary_Lite = Colors.white;
  static Color Primary_Dark =
      Color(int.parse('#2661FA'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Primary_Accent =
      Color(int.parse('#002b83'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Background =
      Color(int.parse('#F2F2F2'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color Icon_Color =
      Color(int.parse('#ffffff'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Highlite_Text_Color =
      Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Text_Color =
      Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color TextField_Error_Color =
      Color(int.parse('#FCDDDD'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color Button_Color1 =
      Color(int.parse('#FC8E22'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Button_Color2 =
      Color(int.parse('#FDA526'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color DropDown =
      Color(int.parse('#EAECEF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Curve_Color =
      Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
}
