import 'dart:async';

import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/toast/gf_toast.dart';

class PersonController extends GetxController {
  final GetStorage _storage = GetStorage();
  final HomeController _homeController = Get.find<HomeController>();
  String? userName;
  String? phone;

  @override
  void onInit() {
    super.onInit();
    userName = _homeController.userName;
    phone = _storage.read("phone");
  }

  void signout(BuildContext context) {
    _storage.remove("userID");
    GFToast.showToast("退出成功", context);
    _homeController.onInit();
    Timer(
      const Duration(seconds: 1),
      () {
        Get.back();
        Get.back();
      },
    );
  }
}
