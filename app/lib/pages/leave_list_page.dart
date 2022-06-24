import 'package:app/controllers/leave_controller.dart';
import 'package:app/utils/over_scroll.dart';
import 'package:app/utils/themes.dart';
import 'package:app/widgets/leave_card.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveListPage extends StatelessWidget {
  const LeaveListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffea499),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "申请列表",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
        actions: [
          _filterButton(context),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: Get.width,
                height: Get.height / 3 - 20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/leave_page.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: MainClipper(),
                child: Container(
                  width: Get.width,
                  height: Get.height / 3 * 2 + 40,
                  color: Themes.white,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height / 3 * 2 + 15,
                      child: ScrollConfiguration(
                        behavior: OverScrollBehavior(),
                        child: ListView(
                          cacheExtent: Get.height / 2,
                          children: const [
                            LeaveCard(
                              status: 0,
                              applicant: "陈乾",
                              approver: "陈婷婷",
                              type: "事假",
                              time: "2022/06/22",
                            ),
                            LeaveCard(
                              status: 1,
                              applicant: "陈乾",
                              approver: "陈婷婷",
                              type: "事假",
                              time: "2022/06/22",
                            ),
                            LeaveCard(
                              status: 2,
                              applicant: "陈乾",
                              approver: "陈婷婷",
                              type: "事假",
                              time: "2022/06/22",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButtonHideUnderline _filterButton(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const Icon(
          Icons.filter_alt_outlined,
        ),
        customItemsIndexes: const [1],
        customItemsHeight: 5,
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item, 0),
            ),
          ),
          const DropdownMenuItem<Divider>(
              enabled: false,
              child: Divider(
                color: Themes.white,
              )),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item, 1),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        itemHeight: 30,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 100,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Themes.lightBlack,
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [time];
  static const List<MenuItem> secondItems = [type];
  static const time = MenuItem(text: '时间', icon: Icons.done);
  static const type = MenuItem(text: '类型', icon: Icons.done);

  static Widget buildItem(MenuItem item, int index) {
    return GetBuilder<LeaveController>(
      init: LeaveController(),
      builder: (controller) => Row(
        children: [
          Icon(
            item.icon,
            color: controller.currentFilter == index
                ? Colors.white
                : Colors.transparent,
            size: 22,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    LeaveController controller = Get.find<LeaveController>();
    switch (item) {
      case MenuItems.time:
        controller.switchFilter(0);
        break;
      case MenuItems.type:
        controller.switchFilter(1);
        break;
    }
  }
}

class MainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, 20)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 20);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
