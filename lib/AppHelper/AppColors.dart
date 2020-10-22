import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static Color Primary = Colors.white;
  static Color Primary_Lite = Colors.white;
  static Color secondary_color = Colors.orange.withOpacity(0.4);
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
  static Color Text_Color = Colors.black;
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

  static var text_filed_border_color = Colors.grey;

  static Color text_color = Colors.black;

  static var error_color = Colors.red;

  static var cursor_color = Colors.black.withOpacity(0.6);
}
