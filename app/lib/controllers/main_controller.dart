import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final PageController _controller = PageController();
  int _currentPage = 0;

  PageController get pageController => _controller;
  int get currentPage => _currentPage;

  void changeIndex(int index) {
    _currentPage = index;
    update();
  }

  void changePage(int index) {
    _currentPage = index;
    _controller.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    // _controller.jumpToPage(index);
    update();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
