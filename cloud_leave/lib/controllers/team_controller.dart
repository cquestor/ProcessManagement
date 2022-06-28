import 'dart:convert';

import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as http;
import 'package:getwidget/components/toast/gf_toast.dart';

class TeamController extends GetxController {
  List<String> memberList = [];
  int _targetID = 0;
  final HomeController _homeController = Get.find<HomeController>();
  final TextEditingController phoneController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    for (String each in await _getMembers()) {
      memberList.add(each);
    }
    update();
  }

  void addUser(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("邀请成员"),
        content: TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: "手机号",
            prefixIcon: Icon(Icons.phone_android),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("取消"),
          ),
          TextButton(
            onPressed: () => _sendInvite(context),
            child: const Text("邀请"),
          ),
        ],
      ),
    );
  }

  void _sendInvite(BuildContext context) async {
    String phone = phoneController.text;
    if (await _checkPhone(phone) == "False") {
      GFToast.showToast("该用户不存在", context);
      return;
    } else {
      if (await _sendRequest() == "success") {
        GFToast.showToast("邀请成功", context);
        Get.back();
      } else {
        GFToast.showToast("邀请失败，请稍后再试", context);
      }
    }
  }

  Future<String> _sendRequest() async {
    http.Response response = await http.Dio().post(
      Datas.memberInviteUrl,
      data: {
        "host": _homeController.userID,
        "target": _targetID,
      },
    );
    return response.toString();
  }

  Future<String> _checkPhone(String phone) async {
    http.Response response = await http.Dio().post(
      Datas.memberPhoneUrl,
      data: {
        "phone": phone,
      },
    );
    if (response.toString() != "False") {
      _targetID = int.parse(response.toString());
    }
    return response.toString();
  }

  Future<dynamic> _getMembers() async {
    http.Response response = await http.Dio().post(
      Datas.memberListUrl,
      data: {
        "host": _homeController.userID,
      },
    );
    var responseJson = jsonDecode(response.toString());
    return responseJson["data"];
  }
}
