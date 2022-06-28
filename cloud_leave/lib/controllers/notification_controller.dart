import 'dart:async';
import 'dart:convert';

import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as http;
import 'package:getwidget/components/toast/gf_toast.dart';

class NotificationController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();
  List<Map<String, dynamic>> inviteList = [];

  @override
  void onInit() async {
    super.onInit();
    inviteList = [];
    for (Map<String, dynamic> each in await listNotification()) {
      inviteList.add(each);
    }
    update();
  }

  void showChoice(
      BuildContext context, int id, int host, String hostName) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("团队邀请"),
        content: Text("您确定要加入$hostName的团队吗？"),
        actions: [
          TextButton(
            onPressed: () async {
              if (await _changeInviteStatus(id, host, 2) == "success") {
                GFToast.showToast("您已拒绝加入团队", context);
                onInit();
                _homeController.onInit();
                Timer(const Duration(seconds: 1), () => Get.back());
              } else {
                GFToast.showToast("操作失败，请稍后再试", context);
              }
            },
            child: const Text(
              "拒绝",
              style: TextStyle(color: Themes.red),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (await _changeInviteStatus(id, host, 1) == "success") {
                GFToast.showToast("您已加入团队", context);
                onInit();
                _homeController.onInit();
                Timer(const Duration(seconds: 1), () => Get.back());
              } else {
                GFToast.showToast("操作失败，请稍后再试", context);
              }
            },
            child: const Text("同意"),
          ),
        ],
      ),
    );
  }

  Future<String> _changeInviteStatus(int id, int host, int status) async {
    http.Response response = await http.Dio().post(
      Datas.inviteChangeStatueUrl,
      data: {
        "id": id,
        "status": status,
        "host": host,
        "target": _homeController.userID,
      },
    );
    return response.toString();
  }

  Future<dynamic> listNotification() async {
    http.Response response = await http.Dio().post(
      Datas.notificationListUrl,
      data: {
        "id": _homeController.userID,
      },
    );
    var responseJson = jsonDecode(response.toString());
    return responseJson["data"];
  }
}
