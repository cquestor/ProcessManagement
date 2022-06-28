import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillCard extends StatelessWidget {
  final int status;
  final String value1;
  final String value2;
  final String value3;
  final Function()? method;
  const BillCard({
    Key? key,
    required this.status,
    required this.value1,
    required this.value2,
    required this.value3,
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
                      : (status == 1 ? "已\n通\n过" : "已\n拒\n绝"),
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
                        Text(value1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("申请类型:  "),
                        Text(value2),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("详细信息:  "),
                        Text(value3),
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
