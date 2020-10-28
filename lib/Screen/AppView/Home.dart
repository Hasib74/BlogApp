import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/DatabaseProvider/DatabaseKeyName.dart';
import 'package:blog_app/DatabaseProvider/FirebaseProvider.dart';
import 'package:blog_app/Model/Post.dart';
import 'package:blog_app/Widgets/AppBarWidget.dart';
import 'package:blog_app/Widgets/LoadingWidget.dart';
import 'package:blog_app/Widgets/PostWidget.dart';
import 'package:blog_app/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  FirebaseProvider firebaseProvider;

  @override
  Widget build(BuildContext context) {
    firebaseProvider = Provider.of<FirebaseProvider>(context);
    return Scaffold(
        backgroundColor: AppColors.Primary,
        appBar: AppBarWidget(context: context, title: language.Home),
        body: StreamBuilder(
          stream: firebaseProvider.streamAllPost(),
          builder: (context, AsyncSnapshot<List<Post>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                print("Active");

                return ListView.builder(

                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    return PostWidget(
                      post: snapshot.data[index],
                    );
                  },
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

/*
* StreamBuilder(
        stream: FirebaseDatabase.instance
            .reference()
            .child(DatabaseKeyName.child_user)
            .onValue,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(language.post_not_found),
            );
          }

          if (snapshot.hasData) {
            if (snapshot.data.snapshot.value != null) {
              Map<dynamic, dynamic> post = snapshot.data.snapshot.value;

              post.forEach((key, value) {
                print("The Key ${key}");
                print("The value ${value}");
              });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }

          return Container(
            child: Text("Wait"),
          );
        },
      ),
*
* */
