import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/DatabaseProvider/DatabaseKeyName.dart';
import 'package:blog_app/DatabaseProvider/FirebaseProvider.dart';
import 'package:blog_app/Model/Post.dart';
import 'package:blog_app/Screen/Display/app_drawer.dart';
import 'package:blog_app/Widgets/AnimatedListViewWidget.dart';
import 'package:blog_app/Widgets/AppBarWidget.dart';
import 'package:blog_app/Widgets/LoadingWidget.dart';
import 'package:blog_app/Widgets/PostWidget.dart';
import 'package:blog_app/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Home extends StatelessWidget {
  FirebaseProvider firebaseProvider;

  @override
  Widget build(BuildContext context) {
    firebaseProvider = Provider.of<FirebaseProvider>(context);

    GlobalKey<ScaffoldState> _global_key = new GlobalKey();

    return Scaffold(
        key: _global_key,
        drawer: AppDrawer(gobal_key: _global_key,),
        backgroundColor: AppColors.Primary,
        appBar: AppBarWidget(
            context: context, title: language.home, key: _global_key),
        body: StreamBuilder(
          stream: firebaseProvider.streamAllPost(),
          builder: (context, AsyncSnapshot<List<Post>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return AnimationLimiter(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        child: SlideAnimation(
                          verticalOffset: 300.0,
                          child: PostWidget(
                            post: snapshot.data[index],
                          ),
                        ),
                      );
                    },
                  ),
                );

                break;
              case ConnectionState.waiting:
                print("Waiting");
                return LoadingWidget();
                break;

              case ConnectionState.none:
                print("None");
                break;

              case ConnectionState.done:
                break;
            }

            // return Container();
          },
        ));
  }
}
