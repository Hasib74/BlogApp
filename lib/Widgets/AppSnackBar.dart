import 'package:blog_app/FlutterProvider/LogInAndRegistationProvider.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showSnackbar({context, text, type, FlushAction flushAction, phoneNumber ,LogInAndRegistationProvider logInAndRegistationProvider}) {
  Flushbar(
    message: "${text}",
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.blue[300],
    ),
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.blue[300],
    mainButton: minButton(flushAction, context, phoneNumber,logInAndRegistationProvider),
  )..show(context);
}

minButton(FlushAction flushAction, context, phoneNumber,logInAndRegistationProvider) {
  switch (flushAction) {
    case FlushAction.RESEND_VERIFICATION:
      return FlatButton(
        onPressed: () {
          logInAndRegistationProvider.verifyPhoneNumber(context: context, phoneNumber: phoneNumber);
        },
        child: Text(
          "RESEND",
          style: TextStyle(color: Colors.green),
        ),
      );
      break;

    default:
      return null;
  }
}

enum FlushAction { RESEND_VERIFICATION }
