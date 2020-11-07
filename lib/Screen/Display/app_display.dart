import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/FlutterProvider/DisplayProvider.dart';
import 'package:blog_app/Screen/Display/Evets.dart';
import 'package:blog_app/Screen/Display/Home.dart';
import 'package:blog_app/Widgets/AppBarWidget.dart';
import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_drawer.dart';

class AppDisplay extends StatelessWidget {
  GlobalKey<ScaffoldState> _global_key = new GlobalKey();

  DisplayProvider displayProvider;

  @override
  Widget build(BuildContext context) {
    displayProvider = Provider.of<DisplayProvider>(context);
    return Scaffold(
      key: _global_key,
      drawer: AppDrawer(
        gobal_key: _global_key,
      ),
      backgroundColor: AppColors.Primary,
      appBar: AppBarWidget(
          context: context,
          title: displayProvider.current_page,
          key: _global_key),
      body: Consumer<DisplayProvider>(
        builder: (context, provider, _) {
          if (provider.current_page == language.home) {
            return Home();
          } else if (provider.current_page == language.event) {
            return Events();
          }
        },
      ),
    );
  }
}
