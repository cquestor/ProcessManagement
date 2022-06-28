import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteCard extends StatelessWidget {
  final String host;
  final int type;
  final Function()? method;
  const InviteCard({
    Key? key,
    required this.host,
    required this.type,
    this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: method,
      child: Container(
        width: Get.width,
        height: 80,
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
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                color: type == 0
                    ? Themes.yellow
                    : (type == 1 ? Themes.green : Colors.red),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  type == 0 ? "未\n处\n理" : (type == 1 ? "已\n通\n过" : "已\n拒\n绝"),
                  style: const TextStyle(
                    fontSize: 16,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "团队邀请",
                      style: TextStyle(
                        fontSize: 18,
                        color: Themes.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("来自$host的团队邀请"),
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
