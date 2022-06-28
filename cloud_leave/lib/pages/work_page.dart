import 'package:cloud_leave/controllers/work_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:cloud_leave/widgets/work_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "外勤管理",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<WorkController>(
          init: WorkController(),
          builder: (controller) => ListView(
            children: controller.workList
                .map(
                  (work) => WorkCard(
                    name: work["name"],
                    city: work["city"],
                    startTime: work["startTime"],
                    endTime: work["endTime"],
                    status: work["status"],
                    method: () => controller.showChoice(
                      context,
                      work['id'],
                      work["name"],
                      work["city"],
                      work["detail"],
                      work["startTime"],
                      work["endTime"],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
