import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/AppHelper/Dimension.dart';
import 'package:flutter/material.dart';

import '../main.dart';

TextFormField DefaultTextField(
    {@required TextEditingController controller,
    FocusNode focusNode,
    @required String label,
    Widget prefixIcon,
    Widget suffixIcon,
    int maxLine = 1,
    TextInputType textInputType = TextInputType.text,
    bool obscureText = false,
    Function(String) vaidator ,String errorText ,Function(String) onChange}) {
  return TextFormField(
    style: TextStyle(
        color: AppColors.Text_Color,
        fontSize: Dimension.Text_Size,
        fontWeight: FontWeight.normal),

    controller: controller,
    focusNode: focusNode,
    autocorrect: false,
    keyboardType: textInputType,
    cursorColor: AppColors.cursor_color,
    maxLines: maxLine,
    obscureText: obscureText,
    textInputAction: TextInputAction.done,
    textAlignVertical: TextAlignVertical.top,
    validator: vaidator,
    onChanged: onChange,
    decoration: InputDecoration(
      errorText: errorText,
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: AppColors.text_filed_border_color),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: AppColors.text_filed_border_color),
        ),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: AppColors.TextField_Error_Color)),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: AppColors.text_filed_border_color),
        ),
        labelText: label,
        labelStyle: TextStyle(
            color: AppColors.text_color,
            fontSize: Dimension.Text_Size,
            fontWeight: FontWeight.normal),
        prefixIcon: prefixIcon != null ? prefixIcon : null,
        errorStyle: TextStyle(
            fontSize: Dimension.Text_Size_Small_Extra,
            color: AppColors.error_color),
        suffixIcon: suffixIcon != null ? suffixIcon : null),
  );
}
