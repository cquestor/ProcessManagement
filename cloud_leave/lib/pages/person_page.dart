import 'package:cloud_leave/controllers/person_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "个人中心",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: GetBuilder<PersonController>(
          init: PersonController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GFListTile(
                  avatar: const Icon(Icons.person),
                  title: const Text("姓名"),
                  subTitleText: controller.userName,
                ),
                GFListTile(
                  avatar: const Icon(Icons.phone_android),
                  title: const Text("手机号"),
                  subTitleText: controller.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () => controller.signout(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          "退出登录",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
