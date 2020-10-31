import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget RoundedButtonWidget(
    {Color color,
    IconData icon,
    double button_size,
    double icon_size,
    Function onClick}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onClick,
      child: Container(
        height: button_size,
        width: button_size,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5),
          ],
          shape: BoxShape.circle,
          color: color ?? AppColors.Primary_Lite.withOpacity(0.7),
        ),
        child: Icon(
          icon ?? Icons.play_circle_outline_sharp,
          size: icon_size,
        ),
      ),
    ),
  );
}
