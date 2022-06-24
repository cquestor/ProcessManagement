import 'package:app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveCard extends StatelessWidget {
  final int status;
  final String applicant;
  final String approver;
  final String type;
  final String time;
  const LeaveCard({
    Key? key,
    this.status = 1,
    required this.applicant,
    required this.approver,
    required this.type,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Themes.lightBlack.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 100,
            decoration: BoxDecoration(
              color: status == 1
                  ? Themes.green
                  : (status == 0 ? Themes.red : Themes.yellow),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    _textLine("申请人", "陈乾"),
                    _textLine("审批人", "陈婷婷"),
                    _textLine("申请类型", "事假"),
                    _textLine("申请时间", "2022/06/22"),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.only(right: 10),
                      child: Center(
                        child: status == 1
                            ? _iconGreen()
                            : (status == 0 ? _iconRed() : _iconYellow()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _textLine(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$label:",
          style: _textStyle,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          value,
          style: _textStyle,
        ),
      ],
    );
  }

  Column _iconGreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_outline_rounded,
          size: 40,
          color: Themes.green,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "已批准",
          style: _labelStyle.copyWith(color: Themes.green),
        ),
      ],
    );
  }

  Column _iconRed() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.cancel_outlined,
          size: 40,
          color: Themes.red,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "未通过",
          style: _labelStyle.copyWith(color: Themes.red),
        ),
      ],
    );
  }

  Column _iconYellow() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline_rounded,
          size: 40,
          color: Themes.yellow,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "待销假",
          style: _labelStyle.copyWith(color: Themes.yellow),
        ),
      ],
    );
  }

  TextStyle get _textStyle => GoogleFonts.zcoolKuaiLe(
        textStyle: const TextStyle(
          fontSize: 16,
          color: Themes.lightBlack,
        ),
      );

  TextStyle get _labelStyle => GoogleFonts.zcoolKuaiLe(
        textStyle: const TextStyle(
          fontSize: 18,
          letterSpacing: 2,
        ),
      );
}
