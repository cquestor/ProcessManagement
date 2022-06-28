import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/widgets/bill_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BillListController extends GetxController {
  List<Widget> billList = [];
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    for (var each in _homeController.billList) {
      print(each);
      String type = "";
      if (each["type"] == 0) {
        type = "增值税发票";
      } else if (each["type"] == 1) {
        type = "定额发票";
      } else if (each["type"] == 2) {
        type = "火车票";
      } else {
        type = "出租车发票";
      }
      billList.add(BillListCard(
          status: each["status"],
          value1: _homeController.userName,
          value2: each["to"],
          value3: type));
    }
    update();
  }
}
