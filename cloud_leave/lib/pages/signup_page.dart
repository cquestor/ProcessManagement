import 'package:cloud_leave/controllers/signup_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.blue,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "welcome",
                style: GoogleFonts.zcoolKuaiLe(
                  textStyle: const TextStyle(
                    fontSize: 40,
                    color: Themes.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<SignupController>(
                init: SignupController(),
                builder: (controller) {
                  return Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Themes.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: controller.nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: "姓名",
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<SignupController>(
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
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetBuilder<SignupController>(
                    builder: (controller) {
                      return Container(
                        width: Get.width / 2,
                        decoration: BoxDecoration(
                          color: Themes.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: controller.codeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.code),
                            hintText: "验证码",
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<SignupController>(
                    builder: (controller) {
                      return ElevatedButton(
                        onPressed: controller.sendTimeLeft < 1
                            ? () => controller.sendCode(context)
                            : null,
                        child: Container(
                          width: Get.width / 2 - 80,
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.send),
                                Text(
                                  controller.sendTimeLeft < 1
                                      ? "发送"
                                      : "${controller.sendTimeLeft}秒",
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<SignupController>(
                builder: (controller) {
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
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<SignupController>(
                builder: (controller) {
                  return Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Themes.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: controller.ensureController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "确认密码",
                      ),
                      obscureText: true,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<SignupController>(
                builder: (controller) {
                  return ElevatedButton(
                    onPressed: () => controller.signup(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      overlayColor: MaterialStateProperty.all(
                          Themes.white.withOpacity(0.2)),
                    ),
                    child: const SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          "注册",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
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
        "注册",
        style: GoogleFonts.zcoolKuaiLe(),
      ),
    );
  }
}
