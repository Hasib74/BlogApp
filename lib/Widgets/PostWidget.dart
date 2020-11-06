import 'package:blog_app/AppHelper/AppConstant.dart';
import 'package:blog_app/AppHelper/AppStyle.dart';
import 'package:blog_app/AppHelper/Dimension.dart';
import 'package:blog_app/Model/Post.dart';
import 'package:blog_app/Model/Voted.dart';
import 'package:blog_app/Route/Arguments/ArgumanetName.dart';
import 'package:blog_app/Route/Arguments/ScreenArguments.dart';
import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Widgets/AppPollViewWidget.dart';
import 'package:blog_app/Widgets/DisplayIamgeAndVideoWidget.dart';
import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostWidget extends StatelessWidget {
  Post post;

  PostWidget({this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30, bottom: 10, top: 20),
      child: Container(
        //height: Dimension.post_card_height,
        width: Dimension.post_card_width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.2)
          ],
        ),
        child: post.type == AppConstant.poll
            ? AppPollViewWidget(
                title: post.title,
                voted_list: post
                    .voted_list /*[
                  Voted(email: "hasib@gmil.com", vot: 0),
                  Voted(email: "hasib@gmil.com", vot: 0),
                  Voted(email: "monu@gmil.com", vot: 0),
                  Voted(email: "akash@gmil.com", vot: 1)
                ]*/
                ,
                poll_data_list: post.poll_data_list,
              )
            : InkWell(
                onTap: () {
                  Navigator.pushNamed(context, POST_DISPLAY,
                      arguments: ScreenArguments(data: {
                        ArgumentName.post: post,
                      }));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imagesAndVideos(),
                    titleAndDescription(context),
                  ],
                ),
              ),
      ),
    );
  }

  Container imagesAndVideos() {
    return Container(
      margin: EdgeInsets.only(left: 14, right: 14, top: 14),
      height: 200,
      child: DisplayIamgeAndVideoWidget(list: post.url),
    );
  }

  titleAndDescription(context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: AppStyle.body_header(context: context),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              post.description,
              style: AppStyle.body(context: context),
              textAlign: TextAlign.start,
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
