import 'package:cloud_leave/controllers/team_controller.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "团队管理",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: GetBuilder<TeamController>(
          init: TeamController(),
          builder: (controller) {
            return ListView(
              children: controller.memberList
                  .map(
                    (name) => GFListTile(
                      avatar: const Icon(
                        Icons.account_box,
                        size: 30,
                      ),
                      title: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          }),
      floatingActionButton: GetBuilder<TeamController>(
          init: TeamController(),
          builder: (controller) {
            return FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () => controller.addUser(context),
              child: const Icon(Icons.add),
            );
          }),
    );
  }
}
