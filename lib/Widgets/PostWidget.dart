import 'package:blog_app/AppHelper/Dimension.dart';
import 'package:blog_app/Model/Post.dart';
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
          children: [images(), titleAndDescription(context)],
        ),
      ),
    );
  }

  Container images() {
    return Container(
      //width: mainWidth / 1.5,
      margin: EdgeInsets.only(left: 14, right: 14, top: 14),
      height: 200,

      child: design_for_image_or_video(post.url),
    );
  }

  Widget design_for_image_or_video(List image_list) {
    if (image_list.length == 1) {
      return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            image: DecorationImage(
                image: new NetworkImage(image_list[0]), fit: BoxFit.cover)),
      );
    } else if (image_list.length == 2) {
      return Container(
        height: 200,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
                // flex: 1,
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image_list[0],
                    ),
                  )),
            )),
            RotatedBox(
              quarterTurns: 1,
              child: Divider(
                height: 2,
                color: Colors.black12,
              ),
            ),
            Expanded(
                //flex: 1,
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image_list[1],
                    ),
                  )),
            )),
          ],
        ),
      );
    } else {
      return Container(
        height: 200,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              image_list[0],
                            ),
                          )),
                    )),
                Divider(
                  height: 2,
                  color: Colors.black12,
                ),
                Expanded(
                  flex: 1,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                image_list[1],
                              ),
                            )),
                      )),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Divider(
                          height: 2,
                          color: Colors.black12,
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      image_list[2],
                                    ),
                                  )),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: image_list.length != 3
                                    ? Text(
                                        "${image_list.length - 3}  +",
                                        style: TextStyle(
                                            fontSize: 35, color: Colors.white),
                                      )
                                    : new Container())
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
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
          Text(
            post.description,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16),
            textAlign: TextAlign.start,
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
