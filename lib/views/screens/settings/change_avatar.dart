import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/utils/dimen_const.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';

import '../../../controller/setting_controller.dart';

class ChangeAvatar extends StatelessWidget {
  const ChangeAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    var setCont = Get.find<SettingController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomText(
              text: 'choose_avatar',
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: secondaryColor,
            ),
            kSizedBoxH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {

                    setCont.changeAvatarFun('a1');
                  },
                  child: CircleAvatar(
                    radius: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/a1.png')),
                          shape: BoxShape.circle,
                          color: secondaryColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                    setCont.changeAvatarFun('a2');
                  },
                  child: CircleAvatar(
                    radius: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/a2.png')),
                          shape: BoxShape.circle,
                          color: secondaryColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                    setCont.changeAvatarFun('a3');
                  },
                  child: CircleAvatar(
                    radius: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/a3.png')),
                          shape: BoxShape.circle,
                          color: secondaryColor),
                    ),
                  ),
                ),
              ],
            ),
            kSizedBoxH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {

                    setCont.changeAvatarFun('b1');
                  },
                  child: CircleAvatar(
                    radius: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/b1.png')),
                          shape: BoxShape.circle,
                          color: secondaryColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                    setCont.changeAvatarFun('b2');
                  },
                  child: CircleAvatar(
                    radius: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/b2.png')),
                          shape: BoxShape.circle,
                          color: secondaryColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                    setCont.changeAvatarFun('b3');
                  },
                  child: CircleAvatar(
                    radius: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/b3.png')),
                          shape: BoxShape.circle,
                          color: secondaryColor),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
