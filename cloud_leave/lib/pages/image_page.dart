import 'package:cloud_leave/utils/datas.dart';
import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagePage extends StatelessWidget {
  final String image;
  const ImagePage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.red,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "图片",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(Datas.imageUrl(image)),
          ),
        ),
      ),
    );
  }
}
