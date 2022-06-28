import 'package:cloud_leave/controllers/notification_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:cloud_leave/widgets/invite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "消息管理",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (controller) {
              return ListView(
                children: controller.inviteList
                    .map(
                      (invite) => InviteCard(
                        host: invite["host"],
                        type: invite["status"],
                        method: invite["status"] == 0
                            ? () => controller.showChoice(
                                  context,
                                  invite["id"],
                                  invite["hostId"],
                                  invite["host"],
                                )
                            : null,
                      ),
                    )
                    .toList(),
              );
            }),
      ),
    );
  }
}
