import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/privacy_policy_controller.dart';
import 'package:sport_fm/utils/color_const.dart';
import '../../widgets/custom_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final privacyPolicyCont = Get.put(PrivacyPolicyController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackTextColor),
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: 'policy'.tr,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          //color: blackColor,
        ),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: Obx(()=>
          SingleChildScrollView(
              child:
                  HtmlWidget(privacyPolicyCont.ruleData.value ?? "")),
        )),

    );
  }
}
