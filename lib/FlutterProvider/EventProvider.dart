import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  String _current_tab;

  String get current_tab => _current_tab;

  changeTab({tab}) {
    _current_tab = tab;
    notifyListeners();
  }
}
