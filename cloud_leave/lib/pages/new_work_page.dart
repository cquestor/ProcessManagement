import 'package:cloud_leave/controllers/new_work_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class NewWorkPage extends StatelessWidget {
  const NewWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.blue,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "外勤申请",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: GetBuilder<NewWorkController>(
              init: NewWorkController(),
              builder: (controller) => Column(
                children: [
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Themes.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GFListTile(
                      avatar: const Icon(Icons.location_city),
                      title: Text(controller.currentAddress ?? "目的城市"),
                      onTap: () => controller.showCityPicker(context),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                      ),
                      Container(
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
                            onConfirm: (time) => controller.changeEndTime(time),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.sendAsk(context),
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
            ),
          ),
        ),
      ),
    );
  }
}
