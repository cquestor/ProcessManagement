import 'package:cloud_leave/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String label1;
  final String label2;
  final String label3;
  final int value1;
  final int value2;
  final int value3;
  final Function()? method;
  const HomeCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.value1,
    required this.value2,
    required this.value3,
    this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Themes.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Themes.black.withOpacity(0.2),
          onTap: method,
          child: Container(
            width: Get.width,
            height: 105,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.zcoolKuaiLe(
                              textStyle: const TextStyle(
                                color: Themes.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Themes.yellow,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "$value1",
                                  style: _labelStyle,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Themes.green,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "$value2",
                                  style: _labelStyle,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Themes.red,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "$value3",
                                  style: _labelStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            label1,
                            style: _labelStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  const AlwaysStoppedAnimation(Themes.yellow),
                              value: (value1 + value2 + value3) == 0
                                  ? 0
                                  : value1 / (value1 + value2 + value3),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            label2,
                            style: _labelStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  const AlwaysStoppedAnimation(Themes.green),
                              value: (value1 + value2 + value3) == 0
                                  ? 0
                                  : value2 / (value1 + value2 + value3),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            label3,
                            style: _labelStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  const AlwaysStoppedAnimation(Themes.red),
                              value: (value1 + value2 + value3) == 0
                                  ? 0
                                  : value3 / (value1 + value2 + value3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle get _labelStyle {
    return GoogleFonts.zcoolKuaiLe(
      textStyle: const TextStyle(
        fontSize: 14,
        color: Themes.black,
      ),
    );
  }
}
