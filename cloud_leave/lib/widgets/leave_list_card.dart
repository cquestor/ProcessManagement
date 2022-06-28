import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LeaveListCard extends StatelessWidget {
  final int type;
  final String title;
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  const LeaveListCard({
    Key? key,
    required this.type,
    required this.title,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 120,
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
            height: 120,
            decoration: BoxDecoration(
              color: type == 0
                  ? Themes.yellow
                  : (type == 1 ? Themes.green : Themes.red),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                title,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "申请人:  ",
                        style: _textStyle,
                      ),
                      Text(
                        value1,
                        style: _textStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "审批人:  ",
                        style: _textStyle,
                      ),
                      Text(
                        value2,
                        style: _textStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "申请类型:  ",
                        style: _textStyle,
                      ),
                      Text(
                        value3,
                        style: _textStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "申请时间:  ",
                        style: _textStyle,
                      ),
                      Text(
                        value4,
                        style: _textStyle,
                      ),
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

  TextStyle get _textStyle {
    return const TextStyle(
      fontSize: 14,
      color: Themes.black,
    );
  }
}
