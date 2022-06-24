import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

class GlobalController extends GetxController {
  late String? currentUsername;

  @override
  void onInit() async {
    super.onInit();
    try {
      await EMClient.getInstance.createAccount("B19041430", "123456");
    } on EMError catch (e) {
      debugPrint("error code: ${e.code}, desc: ${e.description}");
    }
    currentUsername = await EMClient.getInstance.getCurrentUsername();
    debugPrint(currentUsername);
  }
}
