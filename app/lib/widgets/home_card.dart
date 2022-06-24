import 'package:app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String label1;
  final String label2;
  final String label3;
  final int value1;
  final int value2;
  final int value3;
  final String imagePath;
  final Function method;
  const HomeCard({
    Key? key,
    required this.title,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.imagePath,
    required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = value1 + value2 + value3;
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Themes.lightGrey.withOpacity(0.2),
          onTap: () => method(),
          child: Container(
            width: Get.width,
            height: 120,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Themes.lightGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.zcoolKuaiLe(
                              fontSize: 20,
                              color: Themes.lightBlack,
                              letterSpacing: 5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 4,
                                    backgroundColor: Themes.blue,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "$value1",
                                    style: _labelStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 4,
                                    backgroundColor: Themes.green,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "$value2",
                                    style: _labelStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 4,
                                    backgroundColor: Themes.red,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "$value3",
                                    style: _labelStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
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
                            width: 5,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 5,
                              child: LinearProgressIndicator(
                                value: value1 / total,
                                backgroundColor:
                                    Themes.lightGrey.withOpacity(0.2),
                                valueColor:
                                    const AlwaysStoppedAnimation(Themes.blue),
                              ),
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
                            width: 5,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 5,
                              child: LinearProgressIndicator(
                                value: value2 / total,
                                backgroundColor:
                                    Themes.lightGrey.withOpacity(0.2),
                                valueColor:
                                    const AlwaysStoppedAnimation(Themes.green),
                              ),
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
                            width: 5,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 5,
                              child: LinearProgressIndicator(
                                value: value3 / total,
                                backgroundColor:
                                    Themes.lightGrey.withOpacity(0.2),
                                valueColor:
                                    const AlwaysStoppedAnimation(Themes.red),
                              ),
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
      fontSize: 14,
      color: Themes.lightBlack,
      letterSpacing: 2,
    );
  }
}
