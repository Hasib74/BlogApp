import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/AppHelper/AppSpaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

Button_with_icon_and_text(
    {colors,
    button_name,
    icon,
    bool borderEnable = false,
    double width,
    double height,
    double fontSize = 14,
    double padding_left,
    double padding_right,
    bool onlyText = false,
    Padding spaceBtween,
    Color iconColor,
    VoidCallback onClick,
    Color textColor}) {
  return InkWell(
    onTap: onClick,
    child: Container(
      height: height,
      width: width ?? null,
      margin:
          EdgeInsets.only(left: padding_left ?? 0, right: padding_right ?? 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          border: borderEnable
              ? Border.all(color: AppColors.Primary_Accent, width: 2)
              : null,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors ?? [Color(0xffFFAA3A), Color(0xffFF812D)])),
      child: Row(
        mainAxisAlignment:
            /*!onlyText ? MainAxisAlignment.spaceAround :*/ MainAxisAlignment
                .center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          !onlyText ? AppSpaces.spaces_width_10 : Container(),
          !onlyText
              ? icon ??
                  Icon(
                    Icons.group_add,
                    color: iconColor ?? Colors.white,
                  )
              : Container(),
          //!onlyText ? AppSpaces.spaces_width_5 : Container(),
          button_name != null
              ? Text(
                  "${button_name}",
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
          !onlyText ? AppSpaces.spaces_width_10 : Container(),
        ],
      ),
    ),
  );
}
