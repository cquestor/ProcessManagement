import 'dart:ffi';

import 'package:app/controllers/new_leave_controller.dart';
import 'package:app/utils/over_scroll.dart';
import 'package:app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewLeavePage extends StatelessWidget {
  const NewLeavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height / 5,
            decoration: const BoxDecoration(
              color: Color(0xfffea499),
              image: DecorationImage(
                image: AssetImage("images/new_leave.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  width: Get.width,
                  height: Get.height / 5 * 4,
                  color: Themes.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Theme(
                    data: ThemeData(
                      primarySwatch: Themes.lightPrimary,
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () =>
                          FocusScope.of(context).requestFocus(FocusNode()),
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GetBuilder<NewLeaveController>(
                              builder: (controller) {
                                return TextField(
                                  controller: controller.applicantController,
                                  style: _textStyle,
                                  cursorHeight: 17,
                                  decoration: const InputDecoration(
                                    labelText: "申请人",
                                    prefixIcon: Icon(Icons.email),
                                    border: InputBorder.none,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            height: 58,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GetBuilder<NewLeaveController>(
                                      builder: (controller) {
                                    return DropdownButton(
                                      style: _textStyle,
                                      value: controller.dropdownItem,
                                      items: const [
                                        DropdownMenuItem<int>(
                                            value: 0, child: Text("事假")),
                                        DropdownMenuItem<int>(
                                            value: 1, child: Text("病假")),
                                        DropdownMenuItem<int>(
                                            value: 2, child: Text("其他")),
                                      ],
                                      underline: Container(
                                        height: 0,
                                      ),
                                      isExpanded: true,
                                      icon: const Icon(
                                        Icons.arrow_drop_down_outlined,
                                        size: 0,
                                      ),
                                      onChanged: (value) => controller
                                          .changeDropdownItem(value as int),
                                    );
                                  }),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "详细情况",
                                  style: _textStyle.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: GetBuilder<NewLeaveController>(
                                      builder: (controller) {
                                    return TextField(
                                      controller: controller.detailController,
                                      maxLength: 50,
                                      cursorHeight: 17,
                                      maxLines: 3,
                                      style: _textStyle,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GetBuilder<NewLeaveController>(
                              builder: (controller) {
                                return TextField(
                                  controller: controller.applicantController,
                                  style: _textStyle,
                                  cursorHeight: 17,
                                  decoration: const InputDecoration(
                                    labelText: "申请人",
                                    prefixIcon: Icon(Icons.email),
                                    border: InputBorder.none,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GetBuilder<NewLeaveController>(
                              builder: (controller) {
                                return TextField(
                                  controller: controller.applicantController,
                                  style: _textStyle,
                                  cursorHeight: 17,
                                  decoration: const InputDecoration(
                                    labelText: "申请人",
                                    prefixIcon: Icon(Icons.email),
                                    border: InputBorder.none,
                                  ),
                                );
                              },
                            ),
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
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xfffea499),
      centerTitle: true,
      elevation: 0,
      leading: GetBuilder<NewLeaveController>(
          init: NewLeaveController(),
          builder: (controller) {
            return IconButton(
              onPressed: () => controller.backPage(context),
              icon: const Icon(Icons.arrow_back),
            );
          }),
      title: Text(
        "请假申请",
        style: GoogleFonts.zcoolKuaiLe(),
      ),
    );
  }

  TextStyle get _textStyle => GoogleFonts.zcoolKuaiLe(
        textStyle: const TextStyle(
          fontSize: 17,
          color: Themes.lightBlack,
        ),
      );
}
