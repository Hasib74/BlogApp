import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  static TextStyle body_header({context}) => Theme.of(context)
      .textTheme
      .headline6
      .copyWith(color: Colors.black, fontSize: 16);

  static TextStyle body({context}) => Theme.of(context)
      .textTheme
      .bodyText2
      .copyWith(color: Colors.black54, fontSize: 14);

  static TextStyle header({context}) => Theme.of(context).textTheme.headline6;
}
