import 'package:cloud_leave/controllers/leave_list_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveListPage extends StatelessWidget {
  const LeaveListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.purple,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "请假列表",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<LeaveListController>(
            init: LeaveListController(),
            builder: (controller) {
              return ListView(
                children: controller.leaveList,
              );
            }),
      ),
    );
  }
}
