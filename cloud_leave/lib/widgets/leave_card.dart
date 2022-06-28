import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveCard extends StatelessWidget {
  final String name;
  final int type;
  final String startTime;
  final String endTime;
  final int status;
  final Function()? method;
  const LeaveCard({
    Key? key,
    required this.name,
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: method,
      child: Container(
        width: Get.width,
        height: 100,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Themes.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 100,
              decoration: BoxDecoration(
                color: status == 0
                    ? Themes.yellow
                    : (status == 1 ? Themes.green : Colors.red),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  status == 0
                      ? "未\n处\n理"
                      : (status == 1 ? "已\n批\n准" : "已\n驳\n回"),
                  style: const TextStyle(
                    fontSize: 17,
                    color: Themes.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("申请人:  "),
                        Text(name),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("请假类型:  "),
                        Text(type == 0 ? "事假" : (type == 1 ? "病假" : "其他")),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("申请时间:  "),
                        Text("$startTime ~ $endTime"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
