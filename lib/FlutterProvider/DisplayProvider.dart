import 'package:blog_app/main.dart';
import 'package:flutter/material.dart';

class DisplayProvider extends ChangeNotifier {
  String _current_page;

  String get current_page => _current_page;

  DisplayProvider() {
    _current_page = language.home;
  }

  changePage({page_name}) {
    _current_page = page_name;
    notifyListeners();
  }
}
