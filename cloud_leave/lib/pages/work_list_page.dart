import 'package:cloud_leave/controllers/work_list_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:cloud_leave/widgets/work_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkListPage extends StatelessWidget {
  const WorkListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.purple,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "外勤列表",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<WorkListController>(
          init: WorkListController(),
          builder: (controller) => ListView(
            children: controller.workList,
          ),
        ),
      ),
    );
  }
}
