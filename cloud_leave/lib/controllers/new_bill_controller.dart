import 'dart:async';
import 'dart:convert';

import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart' as http;

class NewBillController extends GetxController {
  int currentType = 0;
  String? imageData;
  String? imagePath;
  final ImagePicker _picker = ImagePicker();
  final HomeController _homeController = Get.find<HomeController>();
  final TextEditingController detailController = TextEditingController();

  void changeType(int? value) {
    currentType = value!;
    update();
  }

  void submit(BuildContext context) async {
    String detail = detailController.text;
    if (detail == "") {
      GFToast.showToast("请填写详细信息", context);
      return;
    }
    if (imagePath == null) {
      GFToast.showToast("请选择图片", context);
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
      Datas.billAskUrl,
      data: {
        "host": _homeController.userID,
        "type": currentType,
        "detail": detail,
        "image": imageData,
      },
    );
    return response.toString();
  }

  void chooseImage(BuildContext context) async {
    if (await _requestPermission()) {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageData = base64Encode(await image.readAsBytes());
        imagePath = image.path;
        update();
      }
    } else {
      GFToast.showToast("没有相册权限", context);
    }
  }

  Future<bool> _requestPermission() async {
    var status = await Permission.photos.status;
    if (status.isDenied) {
      if (await Permission.photos.request().isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}
