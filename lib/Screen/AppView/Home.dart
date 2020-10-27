import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.Primary,
        centerTitle: true,
        title: Text(
          language.home,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.add,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );


  }
}
