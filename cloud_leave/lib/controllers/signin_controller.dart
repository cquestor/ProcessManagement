import 'dart:async';
import 'dart:convert';

import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/toast/gf_toast.dart';

class SigninController extends GetxController {
  final GetStorage _storage = GetStorage();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final HomeController _homeController = Get.find<HomeController>();

  void signin(BuildContext context) async {
    String phone = phoneController.text;
    String password = passwordController.text;
    if (await _signin(phone, password) == "fail") {
      GFToast.showToast("账号或密码错误", context);
    } else {
      GFToast.showToast("登录成功", context);
      _homeController.onInit();
      Timer(const Duration(seconds: 1), () {
        Get.back();
        Get.back();
      });
    }
  }

  Future<String> _signin(String phone, String password) async {
    http.Response response = await http.Dio().post(
      Datas.signinUrl,
      data: {
        "phone": phone,
        "password":
            md5.convert(const Utf8Encoder().convert(password)).toString(),
      },
    );
    String result = response.toString();
    if (result != "fail") {
      _storage.write("userID", int.parse(result));
      _storage.write("phone", phone);
      Get.find<HomeController>().userID = int.parse(result);
      response = await http.Dio().post(
        Datas.userNameUrl,
        data: {
          "id": int.parse(result),
        },
      );
      Get.find<HomeController>().userName = response.toString();
    }
    return result;
  }
}
