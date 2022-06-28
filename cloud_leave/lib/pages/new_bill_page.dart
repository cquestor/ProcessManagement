import 'dart:io';

import 'package:cloud_leave/controllers/new_bill_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewBillPage extends StatelessWidget {
  const NewBillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.green,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "报销申请",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<NewBillController>(
              init: NewBillController(),
              builder: (controller) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                              size: 28,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: DropdownButton(
                                value: controller.currentType,
                                items: const [
                                  DropdownMenuItem<int>(
                                    value: 0,
                                    child: Text("增值税发票"),
                                  ),
                                  DropdownMenuItem<int>(
                                    value: 1,
                                    child: Text("定额发票"),
                                  ),
                                  DropdownMenuItem<int>(
                                    value: 2,
                                    child: Text("火车票"),
                                  ),
                                  DropdownMenuItem<int>(
                                    value: 3,
                                    child: Text("出租车发票"),
                                  ),
                                ],
                                underline: Container(
                                  height: 0,
                                ),
                                isExpanded: true,
                                icon: const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  size: 0,
                                ),
                                onChanged: (int? value) =>
                                    controller.changeType(value),
                              ),
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
                            const Text(
                              "详细情况",
                            ),
                            SizedBox(
                              height: 100,
                              child: TextField(
                                controller: controller.detailController,
                                maxLength: 50,
                                cursorHeight: 17,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => controller.chooseImage(context),
                        child: Container(
                          width: Get.width / 3,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Themes.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: controller.imagePath == null
                                    ? const Icon(
                                        Icons.add,
                                        size: 40,
                                      )
                                    : Image.file(File(controller.imagePath!)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () => controller.submit(context),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        child: SizedBox(
                          width: Get.width,
                          height: 58,
                          child: const Center(
                            child: Text(
                              "提交",
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
