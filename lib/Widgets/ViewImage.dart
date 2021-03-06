import 'package:flutter/material.dart';

Widget ViewImageWidget(
    {imageUrl,
    double height = 200,
    bool leftTopPadding = false,
    bool rightTopPadding = false,
    bool leftBottomPadding = false,
    bool rightBottomPadding = false}) {
  return Container(
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft:
                leftBottomPadding ? Radius.circular(25) : Radius.circular(0),
            topLeft: leftTopPadding ? Radius.circular(25) : Radius.circular(0),
            topRight:
                rightTopPadding ? Radius.circular(25) : Radius.circular(0),
            bottomRight:
                rightBottomPadding ? Radius.circular(25) : Radius.circular(0)),
        image: DecorationImage(
            image: new NetworkImage(imageUrl), fit: BoxFit.cover)),
  );
}
