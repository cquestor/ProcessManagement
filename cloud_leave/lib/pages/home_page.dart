import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:cloud_leave/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _topPane(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _leftPane(),
                  _rightPane(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              _centerText(),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<HomeController>(
                builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeCard(
                        imageUrl: "images/home_card_1.png",
                        title: "请假申请",
                        label1: "待审核",
                        label2: "已通过",
                        label3: "未通过",
                        value1: controller.leaveValue1,
                        value2: controller.leaveValue2,
                        value3: controller.leaveValue3,
                        method: () => Get.toNamed("/leaveList"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HomeCard(
                        imageUrl: "images/home_card_2.png",
                        title: "报销申请",
                        label1: "待审核",
                        label2: "已通过",
                        label3: "未通过",
                        value1: controller.billValue1,
                        value2: controller.billValue2,
                        value3: controller.billValue3,
                        method: () => Get.toNamed("/billList"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HomeCard(
                        imageUrl: "images/home_card_3.png",
                        title: "外勤申请",
                        label1: "待审核",
                        label2: "已通过",
                        label3: "未通过",
                        value1: controller.workValue1,
                        value2: controller.workValue2,
                        value3: controller.workValue3,
                        method: () => Get.toNamed("/workList"),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawer: _drawer(),
    );
  }

  Row _centerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "我的事务",
          style: GoogleFonts.zcoolKuaiLe(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Themes.black,
            ),
          ),
        ),
      ],
    );
  }

  Material _rightPane() {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Themes.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () => Get.toNamed("/newWork"),
          splashColor: Themes.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: Get.width / 2 - 15,
            height: Get.height / 8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("images/home_right.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "外勤\n申请",
                style: GoogleFonts.zcoolKuaiLe(
                  fontSize: 24,
                  color: Themes.white,
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Material _leftPane() {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Themes.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: Themes.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          onTap: () => Get.toNamed("/newBill"),
          child: Container(
            width: Get.width / 2 - 15,
            height: Get.height / 8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("images/home_left.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "报销\n申请",
                style: GoogleFonts.zcoolKuaiLe(
                  fontSize: 24,
                  color: Themes.white,
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _topPane() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: Themes.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              splashColor: Themes.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              onTap: () => Get.toNamed("/newLeave"),
              child: Container(
                width: Get.width,
                height: Get.height / 5,
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("images/home_top.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "立即体验",
                        style: GoogleFonts.zcoolKuaiLe(
                          fontSize: 20,
                          color: Themes.black,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Themes.black,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "请假\n申请",
                        style: GoogleFonts.zcoolKuaiLe(
                          fontSize: 30,
                          color: Themes.white,
                          letterSpacing: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Drawer _drawer() {
    return Drawer(
      backgroundColor: Themes.red,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height / 5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GFAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(Datas.imageUrl("head.png")),
                    ),
                    GetBuilder<HomeController>(
                      builder: (controller) {
                        return Visibility(
                          visible: controller.userID == null,
                          child: GFButton(
                            onPressed: () => Get.toNamed("/signin"),
                            text: "登录",
                            color: Themes.blue,
                            size: GFSize.SMALL,
                            textStyle: GoogleFonts.zcoolXiaoWei(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                letterSpacing: 5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    GetBuilder<HomeController>(builder: (controller) {
                      return Visibility(
                        visible: controller.userID != null,
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            controller.userID == null
                                ? ""
                                : controller.userName,
                            style: GoogleFonts.zcoolKuaiLe(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _drawerList(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        "云易假",
        style: GoogleFonts.zcoolKuaiLe(),
      ),
    );
  }

  Column _drawerList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetBuilder<HomeController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GFListTile(
                title: Text(
                  "团队管理",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Themes.white,
                    ),
                  ),
                ),
                avatar: const Icon(
                  Icons.group,
                  color: Themes.white,
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Themes.white,
                ),
                onTap: () => Get.toNamed("/team"),
              ),
              GFListTile(
                title: Text(
                  "消息通知",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Themes.white,
                    ),
                  ),
                ),
                avatar: const Icon(
                  Icons.notifications,
                  color: Themes.white,
                ),
                icon: controller.notificationCount == 0
                    ? null
                    : Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "${controller.notificationCount}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Themes.white,
                            ),
                          ),
                        ),
                      ),
                onTap: () => Get.toNamed("/notification"),
              ),
              GetBuilder<HomeController>(builder: (controller) {
                return GFListTile(
                  title: Text(
                    "请假管理",
                    style: GoogleFonts.zcoolKuaiLe(
                      textStyle: const TextStyle(
                        fontSize: 17,
                        color: Themes.white,
                      ),
                    ),
                  ),
                  avatar: const Icon(
                    Icons.energy_savings_leaf,
                    color: Themes.white,
                  ),
                  icon: controller.leaveCount == 0
                      ? null
                      : Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "${controller.leaveCount}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Themes.white,
                              ),
                            ),
                          ),
                        ),
                  onTap: () => Get.toNamed("/leave"),
                );
              }),
              GFListTile(
                title: Text(
                  "报销管理",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Themes.white,
                    ),
                  ),
                ),
                avatar: const Icon(
                  Icons.receipt,
                  color: Themes.white,
                ),
                icon: controller.billCount == 0
                    ? null
                    : Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "${controller.billCount}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Themes.white,
                            ),
                          ),
                        ),
                      ),
                onTap: () => Get.toNamed("/bill"),
              ),
              GFListTile(
                title: Text(
                  "外勤管理",
                  style: GoogleFonts.zcoolKuaiLe(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Themes.white,
                    ),
                  ),
                ),
                avatar: const Icon(
                  Icons.business_center,
                  color: Themes.white,
                ),
                icon: controller.workCount == 0
                    ? null
                    : Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "${controller.workCount}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Themes.white,
                            ),
                          ),
                        ),
                      ),
                onTap: () => Get.toNamed("/work"),
              ),
            ],
          );
        }),
        GFListTile(
          title: Text(
            "个人中心",
            style: GoogleFonts.zcoolKuaiLe(
              textStyle: const TextStyle(
                fontSize: 17,
                color: Themes.white,
              ),
            ),
          ),
          avatar: const Icon(
            Icons.account_circle,
            color: Themes.white,
          ),
          icon: const Icon(
            Icons.tips_and_updates_outlined,
            color: Themes.white,
            size: 20,
          ),
          onTap: () => Get.toNamed("/person"),
        ),
      ],
    );
  }
}
