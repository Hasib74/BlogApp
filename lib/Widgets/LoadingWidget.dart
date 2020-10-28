import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

LoadingWidget() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            enabled: true,
            child: ListView.builder(
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: mainWidth / 1.7,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            spreadRadius: 20)
                      ]),
                ),
              ),
              itemCount: 6,
            ),
          ),
        ),
      ],
    ),
  );
}
