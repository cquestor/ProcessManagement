import 'package:cloud_leave/controllers/signin_controller.dart';
import 'package:cloud_leave/utils/datas.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: _appBar(),
      body: _body(context),
    );
  }

  SingleChildScrollView _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height / 10,
          ),
          _head(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<SigninController>(
                    init: SigninController(),
                    builder: (controller) {
                      return Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Themes.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: controller.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.phone_android),
                            hintText: "手机号",
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<SigninController>(builder: (controller) {
                  return Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Themes.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "密码",
                      ),
                      obscureText: true,
                    ),
                  );
                }),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "验证码登录",
                        style: TextStyle(
                          color: Themes.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "忘记密码",
                        style: TextStyle(
                          color: Themes.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<SigninController>(builder: (controller) {
                  return ElevatedButton(
                    onPressed: () => controller.signin(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      overlayColor: MaterialStateProperty.all(
                          Themes.white.withOpacity(0.2)),
                    ),
                    child: const SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          "登录",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _head() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GFAvatar(
          size: 50,
          backgroundImage: NetworkImage(Datas.imageUrl("head.png")),
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        "登录",
        style: GoogleFonts.zcoolKuaiLe(),
      ),
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed("/signup"),
          child: SizedBox(
            child: Center(
              child: Text(
                "注册",
                style: GoogleFonts.zcoolKuaiLe(
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
