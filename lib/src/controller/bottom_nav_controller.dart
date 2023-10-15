import 'dart:io';
import 'package:get/get.dart';

enum Page { HOME, TEAMPLAY, SCHEDUAL, MYPAGE }

class BottomNavController extends GetxController {
  RxInt _pageIndex = 0.obs;

  List<int> _history = [0];

  int get index => _pageIndex.value;

  void changeIndex(int value) {
    var page = Page.values[value];
    switch (page) {
      case Page.HOME:
      case Page.TEAMPLAY:
      case Page.SCHEDUAL:
      case Page.MYPAGE:
        moveToPage(value);
    }
  }

  void moveToPage(int value) {
    if (_history.last != value && Platform.isAndroid) {
      _history.add(value);
      print(_history);
    }
    _pageIndex(value);
  }
}
