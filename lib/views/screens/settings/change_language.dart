import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/language_controller.dart';

import '../../../utils/color_const.dart';
import '../../../utils/enum.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: CustomText(
          text: 'change_language'.tr,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      languageController.changeLanguage("en", "US");
                    },
                    child: CustomCard(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/usa.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const CustomText(
                                text: "English",
                              )
                            ],
                          ),
                          Icon(
                            languageController.language.value ==
                                    Language.en.name
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value ==
                                    Language.en.name
                                ? secondaryColor
                                : grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      languageController.changeLanguage("my", "MM");
                    },
                    child: CustomCard(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/mm.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const CustomText(
                                text: "မြန်မာ",
                              )
                            ],
                          ),
                          Icon(
                            languageController.language.value ==
                                    Language.my.name
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value ==
                                    Language.my.name
                                ? secondaryColor
                                : grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
