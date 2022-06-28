import 'package:cloud_leave/controllers/leave_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:cloud_leave/widgets/leave_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "请假管理",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<LeaveController>(
          init: LeaveController(),
          builder: (controller) => ListView(
            children: controller.leaveList
                .map(
                  (leave) => LeaveCard(
                    name: leave["name"],
                    type: leave["type"],
                    startTime: leave["startTime"],
                    endTime: leave["endTime"],
                    status: leave["status"],
                    method: leave["status"] == 0
                        ? () => controller.showChoice(
                              context,
                              leave["id"],
                              leave["name"],
                              leave["type"],
                              leave["detail"],
                              leave["startTime"],
                              leave["endTime"],
                            )
                        : null,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
