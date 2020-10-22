import 'package:blog_app/AppHelper/AppAssets.dart';
import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/AppHelper/AppSpaces.dart';
import 'package:blog_app/FlutterProvider/AnimationProvider.dart';
import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Widgets/ButtonWithIcon.dart';
import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  AnimationProvider animationProvider;

  @override
  Widget build(BuildContext context) {
    animationProvider = Provider.of<AnimationProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          top_view(),
          bottom_view(context),
        ],
      ),
    );
  }

  top_view() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      bottom: mainHeight / 2,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage(
          AppAssets.logInPageBackgroundImage,
        ),
      ),
    );
  }

  bottom_view(context) {
    return AnimatedPositioned(
      duration: new Duration(seconds: 2),
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      top: animationProvider.containerTopPosition,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.Primary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              language.logIn_with,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.black),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button_with_icon_and_text(
                  icon: Icon(
                    Icons.fingerprint,
                    size: 70,
                    color: AppColors.Primary,
                  ),
                  width: 100,
                  height: 100,
                ),
                Button_with_icon_and_text(
                    icon: Icon(
                      Icons.face,
                      size: 70,
                      color: AppColors.Primary,
                    ),
                    width: 100,
                    height: 100),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, REGISTRATION);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${language.do_not_have_an_account}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                  ),
                  AppSpaces.spaces_width_10,
                  Text("${language.registation_now}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.orange)),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
