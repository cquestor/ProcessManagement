import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/widgets/leave_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveListController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();
  List<Widget> leaveList = [];

  @override
  void onInit() {
    super.onInit();
    for (var each in _homeController.leaveList) {
      String title;
      String type;
      if (each["status"] == 0) {
        title = "待\n审\n核";
      } else if (each["status"] == 1) {
        title = "已\n通\n过";
      } else {
        title = "未\n通\n过";
      }
      if (each["type"] == 0) {
        type = "事假";
      } else if (each["type"] == 1) {
        type = "病假";
      } else {
        type = "其他";
      }
      leaveList.add(
        LeaveListCard(
          type: each["status"],
          title: title,
          value1: _homeController.userName,
          value2: each["to"],
          value3: type,
          value4: "${each['startTime']} ~ ${each['endTime']}",
        ),
      );
    }
    update();
  }
}
