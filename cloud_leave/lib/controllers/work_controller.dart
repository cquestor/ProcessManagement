import 'dart:async';
import 'dart:convert';

import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as http;
import 'package:getwidget/getwidget.dart';

class WorkController extends GetxController {
  List<Map> workList = [];
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void onInit() async {
    super.onInit();
    workList = [];
    for (Map each in await getWorkList()) {
      workList.add(each);
    }
    update();
  }

  void showChoice(BuildContext context, int id, String name, String city,
      String detail, String startTime, String endTime) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "请假申请",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.person_outline),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(name),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.location_city),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(city),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.details),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(detail),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.timer_outlined),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("$startTime ~ $endTime"),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (await _changeWorkStatus(id, 2) == "success") {
                GFToast.showToast("已拒绝申请", context);
                onInit();
                _homeController.onInit();
                Timer(const Duration(seconds: 1), () => Get.back());
              } else {
                GFToast.showToast("操作失败，请稍后再试", context);
              }
            },
            child: const Text(
              "拒绝",
              style: TextStyle(
                color: Themes.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (await _changeWorkStatus(id, 1) == "success") {
                GFToast.showToast("已同意申请", context);
                onInit();
                _homeController.onInit();
                Timer(const Duration(seconds: 1), () => Get.back());
              } else {
                GFToast.showToast("操作失败，请稍后再试", context);
              }
            },
            child: const Text(
              "同意",
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _changeWorkStatus(int id, int status) async {
    http.Response response = await http.Dio().post(
      Datas.workChangeStatusUrl,
      data: {
        "id": id,
        "status": status,
      },
    );
    return response.toString();
  }

  Future<dynamic> getWorkList() async {
    http.Response response = await http.Dio().post(
      Datas.workAskListUrl,
      data: {
        "id": _homeController.userID,
      },
    );
    var responseJson = jsonDecode(response.toString());
    return responseJson["data"];
  }
}
