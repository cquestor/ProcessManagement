import 'package:app/controllers/home_controller.dart';
import 'package:app/utils/over_scroll.dart';
import 'package:app/utils/themes.dart';
import 'package:app/widgets/home_card.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: ScrollConfiguration(
            behavior: OverScrollBehavior(),
            child: ListView(
              cacheExtent: Get.height / 2,
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height / 2,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: _topPane(controller),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: _leftPane(controller),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: _rightPane(controller),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "我的事务",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      color: Themes.lightBlack,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                HomeCard(
                  title: "请假",
                  label1: "申请",
                  label2: "通过",
                  label3: "销假",
                  value1: 13,
                  value2: 2,
                  value3: 5,
                  imagePath: "images/leave_card.png",
                  method: () => controller.toLeaveList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                HomeCard(
                  title: "报销",
                  label1: "申请",
                  label2: "通过",
                  label3: "驳回",
                  value1: 2,
                  value2: 5,
                  value3: 1,
                  imagePath: "images/bill_card.png",
                  method: () => controller.toBill(),
                ),
                const SizedBox(
                  height: 20,
                ),
                HomeCard(
                  title: "外勤",
                  label1: "申请",
                  label2: "通过",
                  label3: "打卡",
                  value1: 1,
                  value2: 1,
                  value3: 2,
                  imagePath: "images/fieldwork_card.png",
                  method: () => controller.toFieldwork(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _topPane(HomeController controller) {
    return GestureDetector(
      onTap: () => controller.toLeave(),
      child: ClipPath(
        clipper: TopClipper(),
        child: Container(
          width: Get.width,
          height: Get.height / 4 + 40,
          decoration: BoxDecoration(
            color: const Color(0xfffb8a7a),
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("images/leave.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "立即体验",
                      style: GoogleFonts.zcoolKuaiLe(
                        textStyle: TextStyle(
                          color: Themes.white.withOpacity(0.8),
                          fontSize: 20,
                          letterSpacing: 5,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 28,
                      color: Themes.white.withOpacity(0.8),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "请假\n申请",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: const TextStyle(
                      fontSize: 40,
                      color: Themes.white,
                      letterSpacing: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "请假 销假 查询",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Themes.white.withOpacity(0.8),
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _leftPane(HomeController controller) {
    return GestureDetector(
      onTap: () => controller.toBill(),
      child: ClipPath(
        clipper: LeftClipper(),
        child: Container(
          width: Get.width / 2 - 30,
          height: Get.height / 4 - 20,
          decoration: const BoxDecoration(
            color: Color(0xffaed5ff),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(
                "images/bill.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "报销",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: const TextStyle(
                      fontSize: 28,
                      color: Themes.white,
                      letterSpacing: 5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "账单 小票 支票",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _rightPane(HomeController controller) {
    return GestureDetector(
      onTap: () => controller.toFieldwork(),
      child: ClipPath(
        clipper: RightClipper(),
        child: Container(
          width: Get.width / 2 - 30,
          height: Get.height / 4 - 20,
          decoration: const BoxDecoration(
            color: Color(0xff7788f4),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(
                "images/fieldwork.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "外勤",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: const TextStyle(
                      fontSize: 28,
                      color: Themes.white,
                      letterSpacing: 5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "申请 销假 查询",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 40)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height - 40)
      ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class LeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 40)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, 40)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 40);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
