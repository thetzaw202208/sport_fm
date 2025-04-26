import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sport_fm/utils/dimen_const.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingAnimationWidget.discreteCircle(
          color: secondaryColor,
          size: 30.sp,
        ),
        kSizedBoxH25,
        CustomText(text: 'please_wait'.tr),

      ],
    );
  }
}
