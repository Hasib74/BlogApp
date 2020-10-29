import 'package:blog_app/AppHelper/Dimension.dart';
import 'package:blog_app/Model/Post.dart';
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
        height: Dimension.post_card_height,
        width: Dimension.post_card_width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.2)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [imagesAndVideos(), titleAndDescription(context)],
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
            style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              post.description,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 14,
                  color: Colors.black54,
                  letterSpacing: 0.6,
                  wordSpacing: 0.6),
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
