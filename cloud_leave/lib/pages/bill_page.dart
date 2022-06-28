import 'package:cloud_leave/controllers/bill_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:cloud_leave/widgets/bill_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BillPage extends StatelessWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "报销管理",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<BillController>(
          init: BillController(),
          builder: (controller) => ListView(
            children: controller.billList
                .map(
                  (bill) => BillCard(
                    status: bill["status"],
                    value1: bill["name"],
                    value2: bill["type"],
                    value3: bill["detail"],
                    method: bill["status"] == 0
                        ? () => controller.showChoice(
                            context,
                            bill["id"],
                            bill["name"],
                            bill["type"],
                            bill["detail"],
                            bill["image"])
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
