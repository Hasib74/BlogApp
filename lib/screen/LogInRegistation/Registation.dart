import 'package:blog_app/AppHelper/AppStyle.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Registation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "${language.user_registation}",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
