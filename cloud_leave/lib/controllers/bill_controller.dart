import 'dart:async';
import 'dart:convert';

import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/pages/image_page.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as http;
import 'package:getwidget/getwidget.dart';

class BillController extends GetxController {
  List<Map> billList = [];
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void onInit() async {
    super.onInit();
    billList = [];
    for (Map each in await getBillList()) {
      if (each["type"] == 0) {
        each["type"] = "增值税发票";
      } else if (each["type"] == 1) {
        each["type"] = "定额发票";
      } else if (each["type"] == 2) {
        each["type"] = "火车票";
      } else {
        each["type"] = "出租车发票";
      }
      billList.add(each);
    }
    update();
  }

  void showChoice(BuildContext context, int id, String name, String type,
      String detail, String image) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "报销申请",
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
                  const Icon(Icons.merge_type),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(type),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(ImagePage(image: image)),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(Datas.imageUrl(image)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (await _changeBillStatus(id, 2) == "success") {
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
              if (await _changeBillStatus(id, 1) == "success") {
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

  Future<String> _changeBillStatus(int id, int status) async {
    http.Response response = await http.Dio().post(
      Datas.billChangeStatusUrl,
      data: {
        "id": id,
        "status": status,
      },
    );
    return response.toString();
  }

  Future<dynamic> getBillList() async {
    http.Response response = await http.Dio().post(
      Datas.billAskListUrl,
      data: {
        "id": _homeController.userID,
      },
    );
    var responseJson = jsonDecode(response.toString());
    return responseJson["data"];
  }
}
