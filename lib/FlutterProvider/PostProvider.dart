import 'package:flutter/cupertino.dart';

class PostProvider extends ChangeNotifier {
  bool _leftButtonVisibility;

  bool get leftButtonVisbility => _leftButtonVisibility;

  bool _rightButtonVisibility;

  bool get right_button_visibility => _rightButtonVisibility;

  int _carousel_current_index;

  int get carousel_current_index => _carousel_current_index;

  PostProvider() {
    _carousel_current_index = 0;
    _leftButtonVisibility = true;
    _rightButtonVisibility = true;

    // notifyListeners();
  }

  change_carousel_index(int index) {
    _carousel_current_index = index;
  }

  setLeftButtonVisibility(bool visbility) {
    _leftButtonVisibility = visbility;

    notifyListeners();
  }

  setRightButtonVisibility(bool visbility) {
    _rightButtonVisibility = visbility;

    notifyListeners();
  }
}
