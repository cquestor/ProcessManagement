import 'dart:convert';

import 'package:cloud_leave/controllers/bill_controller.dart';
import 'package:cloud_leave/controllers/leave_controller.dart';
import 'package:cloud_leave/controllers/notification_controller.dart';
import 'package:cloud_leave/controllers/work_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as http;

class HomeController extends GetxController {
  late int leaveValue1;
  late int leaveValue2;
  late int leaveValue3;

  late int billValue1;
  late int billValue2;
  late int billValue3;

  late int workValue1;
  late int workValue2;
  late int workValue3;

  late int notificationCount;
  late int leaveCount;
  late int billCount;
  late int workCount;

  late int? userID;
  late String userName;

  List<Map> leaveList = [];
  List<Map> billList = [];
  List<Map> workList = [];

  final GetStorage _storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    leaveValue1 = 0;
    leaveValue2 = 0;
    leaveValue3 = 0;

    billValue1 = 0;
    billValue2 = 0;
    billValue3 = 0;

    workValue1 = 0;
    workValue2 = 0;
    workValue3 = 0;

    notificationCount = 0;
    leaveCount = 0;
    billCount = 0;
    workCount = 0;

    userID = _storage.read("userID");

    if (userID != null) {
      leaveList = [];
      billList = [];
      workList = [];
      userName = await getName();
      for (var leave in await getLeaveList(userID!)) {
        if (leave["status"] == 0) {
          leaveValue1++;
        }
        if (leave["status"] == 1) {
          leaveValue2++;
        }
        if (leave["status"] == 2) {
          leaveValue3++;
        }
        leaveList.add(leave);
      }
      for (var bill in await getBillList(userID!)) {
        if (bill["status"] == 0) {
          billValue1++;
        }
        if (bill["status"] == 1) {
          billValue2++;
        }
        if (bill["status"] == 2) {
          billValue3++;
        }
        billList.add(bill);
      }
      for (var work in await getWorkList(userID!)) {
        if (work["status"] == 0) {
          workValue1++;
        }
        if (work["status"] == 1) {
          workValue2++;
        }
        if (work["status"] == 2) {
          workValue3++;
        }
        workList.add(work);
      }
      for (Map<String, dynamic> each
          in await NotificationController().listNotification()) {
        if (each["status"] == 0) {
          notificationCount++;
        }
      }
      for (Map<String, dynamic> each in await LeaveController().getLaveList()) {
        if (each["status"] == 0) {
          leaveCount++;
        }
      }
      for (Map<String, dynamic> each in await BillController().getBillList()) {
        if (each["status"] == 0) {
          billCount++;
        }
      }
      for (Map<String, dynamic> each in await WorkController().getWorkList()) {
        if (each["status"] == 0) {
          workCount++;
        }
      }
    }
    update();
  }

  Future<String> getName() async {
    http.Response response = await http.Dio().post(
      Datas.userNameUrl,
      data: {
        "id": userID,
      },
    );
    return response.toString();
  }

  Future<dynamic> getLeaveList(int userID) async {
    http.Response response = await http.Dio().post(
      Datas.leaveListUrl,
      data: {
        "host": userID,
      },
    );
    var responseJson = jsonDecode(response.toString());
    return responseJson["data"];
  }

  Future<dynamic> getBillList(int userID) async {
    http.Response response = await http.Dio().post(
      Datas.billListUrl,
      data: {
        "host": userID,
      },
    );
    var responseJson = jsonDecode(response.toString());
    return responseJson["data"];
  }

  Future<dynamic> getWorkList(int userID) async {
    http.Response response = await http.Dio().post(
      Datas.workListUrl,
      data: {
        "host": userID,
      },
    );
    var responseJson = jsonDecode(response.toString());
    return responseJson["data"];
  }
}
