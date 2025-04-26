import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/utils/dimen_const.dart';
import 'package:sport_fm/views/screens/bottom_nav_menu.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';

import '../../widgets/custom_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //     appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     actions: [
    //     IconButton(
    //     onPressed: () {
    //   Get.back();
    // },
    // icon: Icon(Icons.close))
    // ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline,color: secondaryColor,size: 150,),
            kSizedBoxH25,
            CustomText(text: 'success_title_text'.tr,
            fontSize: 20.sp,
            ),
            kSizedBoxH25,
            CustomText(text: 'success_body_text'.tr,
              fontSize: 24.sp,),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.w),
        child:
        CustomButton(
          // bgColor: walletController.userAccNameWText.text.isEmpty?secondaryColor:secondaryColor.withOpacity(0.4),
            text: 'exit'.tr,

            onTap: () {
             Get.offAll(BottomNavMenu());
            }),
        ),

    );
  }
}
