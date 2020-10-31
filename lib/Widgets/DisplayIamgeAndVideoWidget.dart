import 'package:blog_app/Widgets/VideoViewWidget.dart';
import 'package:blog_app/Widgets/ViewImage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Widget DisplayIamgeAndVideoWidget({List list}) {
  if (list.length == 1) {
    return isImages(list[0])
        ? ViewImageWidget(
            imageUrl: list[0],
            leftBottomPadding: true,
            leftTopPadding: true,
            rightBottomPadding: true,
            rightTopPadding: true)
        : ViewVideoWidget(
            videoUrl: list[0],
            leftBottomPadding: true,
            leftTopPadding: true,
            rightTopPadding: true,
            rightBottomPadding: true,
          );
  } else if (list.length == 2) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
              // flex: 1,
              child: isImages(list[0])
                  ? ViewImageWidget(
                      imageUrl: list[0],
                      leftBottomPadding: true,
                      leftTopPadding: true,
                    )
                  : ViewVideoWidget(
                      videoUrl: list[0],
                      leftBottomPadding: true,
                      leftTopPadding: true,
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
              child: isImages(list[1])
                  ? ViewImageWidget(
                      imageUrl: list[1],
                      rightTopPadding: true,
                      rightBottomPadding: true,
                    )
                  : ViewVideoWidget(
                      videoUrl: list[1],
                      rightTopPadding: true,
                      rightBottomPadding: true,
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
                  child: isImages(list[0])
                      ? ViewImageWidget(
                          imageUrl: list[0],
                          leftTopPadding: true,
                          rightTopPadding: true,
                        )
                      : ViewVideoWidget(
                          videoUrl: list[0],
                          leftTopPadding: true,
                          rightTopPadding: true,
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
                        child: isImages(list[1])
                            ? ViewImageWidget(
                                imageUrl: list[1],
                                leftBottomPadding: true,
                                // rightTopPadding: true,
                              )
                            : ViewVideoWidget(
                                videoUrl: list[1],
                                leftBottomPadding: true,
                                //rightTopPadding: true,
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
                          isImages(list[2])
                              ? ViewImageWidget(
                                  imageUrl: list[2],
                                  rightBottomPadding: true,
                                )
                              : ViewVideoWidget(
                                  videoUrl: list[2],
                                  rightBottomPadding: true,
                                  //  rightTopPadding: true,
                                ),
                          Align(
                              alignment: Alignment.center,
                              child: list.length != 3
                                  ? Text(
                                      "${list.length - 3}  +",
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

bool isImages(String url) {
  bool isImage = false;

  if (url.contains("png") || url.contains("jpg") || url.contains("jpeg")) {
    isImage = true;
  }

  print("Is ts Image  ${isImage}");

  return isImage;
}
