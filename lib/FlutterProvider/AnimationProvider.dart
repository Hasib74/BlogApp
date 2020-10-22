import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';

class AnimationProvider extends ChangeNotifier {
  //logInPage

  double _containerTopPosition;

  double get containerTopPosition => _containerTopPosition;

  AnimationProvider() {
    _containerTopPosition = mainHeight / 2.5;
  }

  changeContainerTopPosition(double positon) {
    _containerTopPosition = positon;
    notifyListeners();
  }
}
