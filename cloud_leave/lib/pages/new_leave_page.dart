import 'package:cloud_leave/controllers/new_leave_controller.dart';
import 'package:cloud_leave/controllers/new_work_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class NewLeavePage extends StatelessWidget {
  const NewLeavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.yellow,
      appBar: _appBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                        child: GetBuilder<NewLeaveController>(
                          init: NewLeaveController(),
                          builder: (controller) {
                            return DropdownButton(
                              value: controller.currentType,
                              items: const [
                                DropdownMenuItem<int>(
                                  value: 0,
                                  child: Text("事假"),
                                ),
                                DropdownMenuItem<int>(
                                  value: 1,
                                  child: Text("病假"),
                                ),
                                DropdownMenuItem<int>(
                                  value: 2,
                                  child: Text("其他"),
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
                            );
                          },
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        child: GetBuilder<NewLeaveController>(
                          builder: (controller) {
                            return TextField(
                              controller: controller.detailController,
                              maxLength: 50,
                              cursorHeight: 17,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<NewLeaveController>(
                      builder: (controller) {
                        return Container(
                          width: (Get.width - 40) / 2 - 5,
                          decoration: BoxDecoration(
                            color: Themes.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GFListTile(
                            avatar: const Icon(Icons.calendar_month),
                            title: Text(controller.startTime ?? "开始时间"),
                            onTap: () => DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2022, 12, 30),
                              locale: LocaleType.zh,
                              onConfirm: (time) =>
                                  controller.changeStartTime(time),
                            ),
                          ),
                        );
                      },
                    ),
                    GetBuilder<NewLeaveController>(
                      builder: (controller) {
                        return Container(
                          width: (Get.width - 40) / 2 - 5,
                          decoration: BoxDecoration(
                            color: Themes.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GFListTile(
                            avatar: const Icon(Icons.calendar_month),
                            title: Text(controller.endTime ?? "结束时间"),
                            onTap: () => DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2022, 12, 30),
                              locale: LocaleType.zh,
                              onConfirm: (time) =>
                                  controller.changeEndTime(time),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<NewLeaveController>(
                  builder: (controller) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                      ),
                      onPressed: () => controller.sendAsk(context),
                      child: const SizedBox(
                        height: 48,
                        child: Center(
                          child: Text(
                            "申请",
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
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        "请假申请",
        style: GoogleFonts.zcoolKuaiLe(),
      ),
    );
  }
}
