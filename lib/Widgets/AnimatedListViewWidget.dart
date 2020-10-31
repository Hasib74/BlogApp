import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget AnimatedListViewWidget(
    {@required itemCount,
    @required Widget child,
    int milliseconds = 700,
    double verticalOffset = 300}) {
  return AnimationLimiter(
    child: ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, int index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: Duration(milliseconds: milliseconds),
          child: SlideAnimation(verticalOffset: verticalOffset, child: child),
        );
      },
    ),
  );
}
