import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/widgets/work_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WorkListController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();
  List<Widget> workList = [];

  @override
  void onInit() {
    super.onInit();
    for (var each in _homeController.workList) {
      workList.add(WorkListCard(
          status: each["status"],
          value1: _homeController.userName,
          value2: each["name"],
          value3: each["city"],
          value4: "${each["startTime"]} ~ ${each["endTime"]}"));
    }
    update();
  }
}
