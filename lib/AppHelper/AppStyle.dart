import 'package:flutter/cupertino.dart';

class AppStyle {
 static TextStyle header_extra_bold({
    Color color,
    double text_size,
    FontWeight fontWeight,
  }) {
    return TextStyle(
        color: color,
        fontSize: text_size ?? 25,
        fontWeight: fontWeight ?? FontWeight.bold);
  }
}
