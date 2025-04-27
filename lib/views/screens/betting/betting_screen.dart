import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/views/screens/betting/three_d_screen.dart';
import 'package:sport_fm/views/screens/betting/two_d_screen.dart';
import '../../../controller/setting_controller.dart';
import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../widgets/custom_text.dart';

class BettingScreen extends StatelessWidget {
  const BettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var settingController = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Image.asset(logoImg,fit: BoxFit.fitHeight,),
        )
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.w),
        child: ListView(
          children: [
            BalanceWidget(settingController: settingController),
            kSizedBoxH25,
            kSizedBoxH30,
            Padding(
              padding:  EdgeInsets.only(left: 10.w
              ),
              child: CustomText(text: 'services'.tr,fontWeight: FontWeight.bold,),
            ),
            kSizedBoxH10,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                         Get.to(TwoDScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.4,
                          height: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: secondaryColor)
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              kSizedBoxH10,
                              Image.asset('assets/images/twoD.webp',width: 80.w,height: 80.h,),
                              Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.r),
                                        bottomRight: Radius.circular(10.r),
                                      )
                                  ),
                                  child: Center(child: CustomText(text: 'two_d'.tr,color: primaryColor,fontWeight: FontWeight.bold,)))
                            ],
                          ) ,
                        ),
                      ),
                      InkWell(
                        onTap: (){

                          Get.to(ThreeDScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.4,
                          height: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: secondaryColor)
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              kSizedBoxH10,
                              Image.asset('assets/images/threeD.webp',width: 80.w,height: 80.h,),
                              Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.r),
                                        bottomRight: Radius.circular(10.r),
                                      )
                                  ),
                                  child: Center(child: CustomText(text: 'three_d'.tr,color: primaryColor,fontWeight: FontWeight.bold,)))
                            ],
                          ) ,
                        ),
                      )
                    ],
                  ),
                  kSizedBoxH30,
                  // Container(
                  //   width: MediaQuery.of(context).size.width*.4,
                  //   height: MediaQuery.of(context).size.width*.4,
                  //   decoration: BoxDecoration(
                  //       color: primaryColor,
                  //       borderRadius: BorderRadius.circular(10.r),
                  //       border: Border.all(color: secondaryColor)
                  //   ),
                  //   child:Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       kSizedBoxH10,
                  //       Image.asset('assets/images/history.webp',width: 80.w,height: 80.h,),
                  //       Container(
                  //           width: MediaQuery.of(context).size.width*.4,
                  //           height: 30.h,
                  //           decoration: BoxDecoration(
                  //               color: secondaryColor,
                  //               borderRadius: BorderRadius.only(
                  //                 bottomLeft: Radius.circular(10.r),
                  //                 bottomRight: Radius.circular(10.r),
                  //               )
                  //           ),
                  //           child: Center(child: CustomText(text: 'history'.tr,color: primaryColor,fontWeight: FontWeight.bold,)))
                  //     ],
                  //   ) ,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }

}
class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
    required this.settingController,
  });

  final SettingController settingController;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 170.h,
      decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.75),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius:20,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/images/fm.webp'))
                        ),
                      ),
                    ),
                    kSizedBoxW10,
                    Obx(()=> CustomText(fontSize: 15.sp,fontWeight: FontWeight.bold,text: settingController.name.value,color: primaryColor))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'user_id'.tr,color: primaryColor),
                    Obx(()=> CustomText(text: settingController.phone.value,color: primaryColor)),
                    IconButton(onPressed: (){

                    }, icon: Icon(Icons.copy,color: secondaryColor.withOpacity(0.0),))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'balance'.tr,color: primaryColor),
                    Obx(()=> Row(
                      children: [
                        CustomText(text:settingController.isObscure.value? settingController.balance.value:'*********',color: primaryColor),
                        Image.asset('assets/images/mmk.png',width: 30.w,height: 20.h,)
                      ],
                    )),
                    Obx(()=>
                        IconButton(
                            onPressed: (){
                              settingController.setVisibleOnOff();
                            }, icon: Icon(settingController.isObscure.value?Icons.visibility:Icons.visibility_off,color: whiteColor,)),
                    )
                  ],
                )
              ],
            ),
          )),
          Container(
            height: 30.h,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: secondaryColor,borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(text: DateTime.now().toString().split(".")[0],color: primaryColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}