import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillListCard extends StatelessWidget {
  final int status;
  final String value1;
  final String value2;
  final String value3;
  const BillListCard({
    Key? key,
    required this.status,
    required this.value1,
    required this.value2,
    required this.value3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  : (status == 1 ? Themes.green : Themes.red),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                status == 0 ? "待\n审\n核" : (status == 1 ? "已\n通\n过" : "未\n通\n过"),
                style: const TextStyle(
                  fontSize: 17,
                  color: Themes.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("审批人:  "),
                      Text(value2),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("报销类型:  "),
                      Text(value3),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
