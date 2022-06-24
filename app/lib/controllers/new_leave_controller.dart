import 'package:app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewLeaveController extends GetxController {
  final TextEditingController _applicantController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  int _dropdownItem = 0;

  TextEditingController get applicantController => _applicantController;
  TextEditingController get detailController => _detailController;
  int get dropdownItem => _dropdownItem;

  void changeDropdownItem(int value) {
    _dropdownItem = value;
    update();
  }

  void backPage(BuildContext context) {
    if (_applicantController.text == "" && _detailController.text == "") {
      Get.back();
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "确定返回",
            style: GoogleFonts.zcoolKuaiLe(),
          ),
          content: Text(
            "您所填写的内容将不会被保存，确定退出申请吗？",
            style: GoogleFonts.zcoolKuaiLe(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "取消",
                style: GoogleFonts.zcoolKuaiLe(
                  textStyle: const TextStyle(
                    color: Themes.red,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: Text(
                "确定",
                style: GoogleFonts.zcoolKuaiLe(),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _applicantController.dispose();
    super.dispose();
  }
}
