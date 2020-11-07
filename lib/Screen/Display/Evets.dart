import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tabs(),
      ],
    );
  }

  Tabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 24,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 20, blurRadius: 20),
          ], color: Colors.black),
          child: Center(
            child: Text(language.upcoming),
          ),
        ),
        Container(
          height: 24,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 20, blurRadius: 20),
          ], color: Colors.black),
          child: Center(
            child: Text(language.going),
          ),
        ),
      ],
    );
  }
}
