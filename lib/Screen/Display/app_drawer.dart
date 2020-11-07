import 'package:blog_app/AppHelper/AppSpaces.dart';
import 'package:blog_app/AppHelper/AppStyle.dart';
import 'package:blog_app/FlutterProvider/DisplayProvider.dart';
import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> gobal_key;

  AppDrawer({@required this.gobal_key});

  DisplayProvider displayProvider;

  @override
  Widget build(BuildContext context) {
    displayProvider = Provider.of<DisplayProvider>(context);

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.spaces_height_25,
            AppSpaces.spaces_height_25,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {
                    back(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimationLimiter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 375),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        AppSpaces.spaces_height_20,
                        InkWell(
                          onTap: () {
                            displayProvider.changePage(
                                page_name: language.home);

                            back(context);
                          },
                          child: Text(
                            language.home,
                            style: AppStyle.body_header(context: context)
                                .copyWith(fontSize: 20),
                          ),
                        ),
                        AppSpaces.spaces_height_20,
                        Text(
                          language.profile,
                          style: AppStyle.body_header(context: context)
                              .copyWith(fontSize: 20),
                        ),
                        AppSpaces.spaces_height_20,
                        InkWell(
                          onTap: () {
                            displayProvider.changePage(
                                page_name: language.event);
                            back(context);
                          },
                          child: Text(
                            language.event,
                            style: AppStyle.body_header(context: context)
                                .copyWith(fontSize: 20),
                          ),
                        ),
                        /* Text(language.home),
                        Text(language.home),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
