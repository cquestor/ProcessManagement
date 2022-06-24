import 'package:get/get.dart';

class LeaveController extends GetxController {
  int _currentFilter = 0;

  int get currentFilter => _currentFilter;

  void switchFilter(int index) {
    _currentFilter = index;
    update();
  }
}
