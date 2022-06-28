import 'dart:async';

import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as http;

class NewLeaveController extends GetxController {
  int currentType = 0;
  String? startTime;
  String? endTime;
  final GetStorage _storage = GetStorage();
  final TextEditingController detailController = TextEditingController();
  final HomeController _homeController = Get.find<HomeController>();

  void changeType(int? value) {
    currentType = value!;
    update();
  }

  void changeStartTime(DateTime time) {
    startTime = DateFormat('yyyy-MM-dd').format(time);
    update();
  }

  void changeEndTime(DateTime time) {
    endTime = DateFormat('yyyy-MM-dd').format(time);
    update();
  }

  void sendAsk(BuildContext context) async {
    String detail = detailController.text;
    if (detail == "") {
      GFToast.showToast("请填写详细情况", context);
      return;
    }
    if (startTime == null) {
      GFToast.showToast("请选择开始时间", context);
      return;
    }
    if (endTime == null) {
      GFToast.showToast("请选择结束时间", context);
      return;
    }
    if (await _sendAsk(detail) == "fail") {
      GFToast.showToast("您还未加入团队", context);
    } else {
      GFToast.showToast("申请成功", context);
      _homeController.onInit();
      Timer(const Duration(seconds: 1), () => Get.back());
    }
  }

  Future<String> _sendAsk(String detail) async {
    http.Response response = await http.Dio().post(
      Datas.leaveAskUrl,
      data: {
        "host": _storage.read("userID"),
        "type": currentType,
        "detail": detail,
        "startTime": startTime,
        "endTime": endTime,
      },
    );
    return response.toString();
  }
}
