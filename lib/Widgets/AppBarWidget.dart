import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/AppHelper/AppStyle.dart';
import 'package:flutter/material.dart';

import '../main.dart';

Widget AppBarWidget(
    {title, @required context, @required GlobalKey<ScaffoldState> key}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: AppColors.Primary_Lite,
    centerTitle: true,
    leading: InkWell(
      onTap: () {
        key.currentState.openDrawer();
      },
      child: Icon(
        Icons.menu,
        color: Colors.black,
      ),
    ),
    title: Text(
      title,
      style: AppStyle.header(context: context),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Icon(
          Icons.notifications_none_outlined,
          color: AppColors.black,
        ),
      ),
    ],
  );
}
