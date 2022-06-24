import 'package:app/controllers/main_controller.dart';
import 'package:app/utils/routes.dart';
import 'package:app/utils/shadow_path.dart';
import 'package:app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) => PageView(
          controller: controller.pageController,
          // physics: const NeverScrollableScrollPhysics(),
          children: Routes.contents,
          onPageChanged: (index) => controller.changeIndex(index),
        ),
      ),
      bottomNavigationBar: GetBuilder<MainController>(
        builder: (controller) => _bottomNavBar(controller),
      ),
    );
  }

  Widget _bottomNavBar(MainController controller) {
    return SizedBox(
      height: 65,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              onTap: (value) => controller.changePage(value),
              currentIndex: controller.currentPage,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme: const IconThemeData(
                size: 30,
                color: Themes.red,
              ),
              unselectedIconTheme: const IconThemeData(
                size: 30,
                color: Themes.lightGrey,
              ),
              type: BottomNavigationBarType.fixed,
              items: _bottomItems,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _centerBarItem(controller),
          ),
        ],
      ),
    );
  }

  GestureDetector _centerBarItem(MainController controller) {
    return GestureDetector(
      onTap: () => controller.changePage(2),
      child: SizedBox(
        width: 50,
        height: 55,
        child: Column(
          children: [
            ClipShadowPath(
              shadow: Shadow(
                offset: const Offset(2, 2),
                blurRadius: controller.currentPage == 2 ? 10 : 5,
                color: controller.currentPage == 2
                    ? Themes.red.withOpacity(0.8)
                    : Themes.red.withOpacity(0.6),
              ),
              clipper: HexClipper(),
              child: Container(
                width: 50,
                height: 50,
                color: Themes.red,
                child: Center(
                  child: Icon(
                    Icons.group,
                    size: controller.currentPage == 2 ? 35 : 30,
                    color: Themes.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get _bottomItems =>
      const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "首页",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics_outlined),
          label: "统计",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.groups_outlined,
            color: Colors.transparent,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active_outlined),
          label: "消息",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin_outlined),
          label: "我的",
        ),
      ];
}

class HexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width * 0.5, 0)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(0, size.height * 0.8)
      ..lineTo(0, size.height * 0.2)
      ..lineTo(size.width * 0.5, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
