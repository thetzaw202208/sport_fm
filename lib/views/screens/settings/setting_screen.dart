import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sport_fm/controller/setting_controller.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/utils/dimen_const.dart';
import 'package:sport_fm/views/screens/settings/change_avatar.dart';
import 'package:sport_fm/views/screens/settings/change_language.dart';
import 'package:get/get.dart';
import 'package:sport_fm/views/widgets/custom_loading.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';
import 'privacy_policy_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController pController = Get.put(SettingController());
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(logoImg,fit: BoxFit.fitHeight,),
          ),
        ),
        body: Obx(()=>
        pController.isLoading.value?
            Center(child: CustomLoading()):
           Padding(
            padding: EdgeInsets.all(10.w),
            child: ListView(
              children: [
                Obx(()=>
                   CircleAvatar(
                    radius: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/${pController.avatar.value}.png')),
                          shape: BoxShape.circle, color: secondaryColor),
                    ),
                  ),
                ),

                Center(
                    child: InkWell(
                        onTap: () {
                          Get.to(ChangeAvatar());
                        },
                        child: CustomText(
                          text: 'change_avatar'.tr,
                          color: secondaryColor,
                        ))),
                kSizedBoxH25,
                CustomText(text: 'profile'.tr),
                SizedBox(height: 5.h),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: 'name'.tr, color: whiteColor),
                          Obx(()=>
                            CustomText(
                              text: pController.name.value,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                      kSizedBoxH10,
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: 'phone'.tr, color: whiteColor),
                          Obx(()=>
                            CustomText(
                              text: pController.phone.value,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                      kSizedBoxH10,
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: 'user_id'.tr, color: whiteColor),
                          Obx(()=>CustomText(
                            text: pController.userID.value,
                            color: whiteColor,
                          )),
                        ],
                      )
                    ],
                  ),
                ),

                // Obx(
                //   () => Switch(
                //     value: settingController.currentTheme.value == ThemeMode.dark,
                //     onChanged: (value) {
                //       settingController.switchTheme();
                //       Get.changeThemeMode(settingController.currentTheme.value);
                //     },
                //     activeColor: CustomTheme.white,
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(text: 'settings'.tr),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ChangeLanguageScreen());
                  },
                  child: CustomCard(
                    color: secondaryColor,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.language,
                                size: 18.sp, color: primaryColor),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(text: 'language'.tr, color: primaryColor)
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                                text: 'lang'.tr,
                                fontSize: 12.sp,
                                color: primaryColor),
                            Icon(Icons.arrow_forward_ios,
                                size: 18.sp, color: primaryColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const PrivacyPolicyScreen());
                  },
                  child: CustomCard(
                    color: secondaryColor,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.policy_outlined,
                                size: 18.sp, color: primaryColor),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              text: 'policy'.tr,
                              color: primaryColor,
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.sp,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomCard(
                  color: secondaryColor,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline_rounded,
                              size: 18.sp, color: primaryColor),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(text: 'version'.tr, color: primaryColor),
                        ],
                      ),
                      CustomText(text: '1.0.0', color: primaryColor),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {
pController.goLogoutFun();
                   // Get.to(() => const ChangeLanguageScreen());
                  },
                  child: CustomCard(
                    color: red,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout,
                                size: 18.sp, color: primaryColor),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(text: 'logout'.tr, color: primaryColor)
                          ],
                        ),
                        Row(
                          children: [
                            // CustomText(
                            //     text: 'lang'.tr,
                            //     fontSize: 12.sp,
                            //     color: primaryColor),
                            Icon(Icons.arrow_forward_ios,
                                size: 18.sp, color: primaryColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
