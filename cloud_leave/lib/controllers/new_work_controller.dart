import 'dart:async';

import 'package:city_pickers/city_pickers.dart';
import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as http;

class NewWorkController extends GetxController {
  String? currentAddress;
  String? _currentCity;
  String? startTime;
  String? endTime;
  final TextEditingController detailController = TextEditingController();
  final HomeController _homeController = Get.find<HomeController>();

  void showCityPicker(BuildContext context) async {
    Result? result = await CityPickers.showCityPicker(
      context: context,
    );
    if (result != null) {
      currentAddress =
          "${result.provinceName}-${result.cityName}-${result.areaName}";
      _currentCity = result.cityName!;
    }
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
    if (_currentCity == null || _currentCity == "") {
      GFToast.showToast("请选择目的城市", context);
      return;
    }
    if (detail == "") {
      GFToast.showToast("请输入详细信息", context);
      return;
    }
    if (startTime == null) {
      GFToast.showToast("请选择开始日期", context);
      return;
    }
    if (endTime == null) {
      GFToast.showToast("请选择结束日期", context);
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
      Datas.workAskUrl,
      data: {
        "host": _homeController.userID,
        "city": _currentCity,
        "detail": detail,
        "startTime": startTime,
        "endTime": endTime,
      },
    );
    return response.toString();
  }
}
