import 'dart:async';
import 'dart:convert';
import 'package:cloud_leave/utils/datas.dart';
import 'package:dio/dio.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/getwidget.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';

class SignupController extends GetxController {
  int sendTimeLeft = 0;
  String _errorMsg = "";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ensureController = TextEditingController();

  void sendCode(BuildContext context) async {
    if (phoneController.text.length != 11) {
      GFToast.showToast("手机号格式错误", context);
      return;
    }
    if (await _sendCode(phoneController.text) == "success") {
      GFToast.showToast("发送成功，注意查收", context);
    } else {
      GFToast.showToast("发送失败，请稍后再试", context);
    }
    sendTimeLeft = 30;
    update();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (sendTimeLeft < 1) {
        timer.cancel();
      } else {
        sendTimeLeft--;
        update();
      }
    });
  }

  void signup(BuildContext context) async {
    String name = nameController.text;
    String phone = phoneController.text;
    String code = codeController.text;
    String password = passwordController.text;
    if (name == "") {
      GFToast.showToast("请填写姓名", context);
      return;
    }
    if (code == "") {
      GFToast.showToast("请填写验证码", context);
      return;
    }
    if (password != ensureController.text) {
      GFToast.showToast("两次输入的密码不一致", context);
      return;
    }
    if (await _signup(name, phone, code, password) == "success") {
      GFToast.showToast("注册成功", context);
      Timer(const Duration(seconds: 1), () => Get.back());
    } else {
      GFToast.showToast(_errorMsg, context);
    }
  }

  Future<String> _signup(
      String name, String phone, String code, String password) async {
    http.Response response = await http.Dio().post(
      Datas.signupUrl,
      data: {
        "name": name,
        "phone": phone,
        "code": code,
        "password":
            md5.convert(const Utf8Encoder().convert(password)).toString(),
      },
    );
    _errorMsg = response.toString();
    return response.toString();
  }

  Future<String> _sendCode(String phone) async {
    http.Response response =
        await http.Dio().post(Datas.signupCodeUrl, data: {"phone": phone});
    return response.toString();
  }
}
