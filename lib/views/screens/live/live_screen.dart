// import 'dart:math';
//
// import 'package:dotted_line/dotted_line.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottery_info/constants/color_const.dart';
// import 'package:lottery_info/constants/dimen_const.dart';
// import 'package:lottery_info/generated/locale_keys.g.dart';
// import 'package:lottery_info/widgets/custom_text.dart';
//
// class LiveScreen extends StatelessWidget {
//   const LiveScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: primaryColor,
//         title: CustomText(
//           text: LocaleKeys.kAppName.tr(),
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       body: Padding(
//         padding:  EdgeInsets.all(10.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomText(
//               text: "07",
//               fontWeight: FontWeight.bold,
//               fontSize: 50.sp,
//               color: secondaryColor,
//             ),
//             kSizedBoxH20,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.check_circle,color: secondaryColor,size: 15.w,),
//                 CustomText(textAlign: TextAlign.center, text: "${LocaleKeys.kUpdated.tr()} ${DateTime.now().toString().split(".")[0]}",
//                   fontWeight: FontWeight.bold,
//
//                   ),
//               ],
//             ),
//             kSizedBoxH30,
//             Container(
//
//               decoration: BoxDecoration(
//                 color: secondaryColor,
//                 borderRadius: BorderRadius.circular(10.r)
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(10.w),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CustomText(text: "12:01 PM",color: primaryColor,),
//                     kSizedBoxH10,
//                     DottedLine(dashColor: primaryColor,),
//                     kSizedBoxH10,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(text: LocaleKeys.kSet.tr(),color: primaryColor.withOpacity(0.6),),
//                             kSizedBoxH10,
//                             CustomText(text: "1302.09",color: primaryColor,),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(text: LocaleKeys.kValue.tr(),color: primaryColor.withOpacity(0.6),),
//                             kSizedBoxH10,
//                             CustomText(text: "1302.09",color: primaryColor,),
//                           ],
//                         ),Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(text: LocaleKeys.k2D.tr(),color: primaryColor.withOpacity(0.6),),
//                             kSizedBoxH10,
//                             CustomText(text: "1302.09",color: primaryColor,),
//                           ],
//                         )
//                       ],
//                     )
//
//                   ],
//                 ),
//               ),
//             ),
//             kSizedBoxH10,
//             Container(
//
//               decoration: BoxDecoration(
//                   color: secondaryColor,
//                   borderRadius: BorderRadius.circular(10.r)
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(10.w),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CustomText(text: "04:30 PM",color: primaryColor,),
//                     kSizedBoxH10,
//                     DottedLine(dashColor: primaryColor,),
//                     kSizedBoxH10,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(text: LocaleKeys.kSet.tr(),color: primaryColor.withOpacity(0.6),),
//                             kSizedBoxH10,
//                             CustomText(text: "1302.09",color: primaryColor,),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(text: LocaleKeys.kValue.tr(),color: primaryColor.withOpacity(0.6),),
//                             kSizedBoxH10,
//                             CustomText(text: "1302.09",color: primaryColor,),
//                           ],
//                         ),Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(text: LocaleKeys.k2D.tr(),color: primaryColor.withOpacity(0.6),),
//                             kSizedBoxH10,
//                             CustomText(text: "1302.09",color: primaryColor,),
//                           ],
//                         )
//                       ],
//                     )
//
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sport_fm/controller/live_controller.dart';
import 'package:sport_fm/views/widgets/custom_loading.dart';
import '../../../utils/color_const.dart';
import '../../widgets/custom_text.dart';

class LiveAndResultScreen extends StatelessWidget {
  const LiveAndResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LiveController liveController = Get.put(LiveController());
    //RewardedAdManager rewardedAdManager = RewardedAdManager();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: primaryColor,
          title: CustomText(
            text: 'app_name'.tr,
            fontWeight: FontWeight.bold,
          ),
          // actions: [
          //   IconButton(onPressed: (){
          //     context.navigateAndRemoveUntil(ProfileScreen(),false);
          //   }, icon: Icon(Icons.person))
          // ],
        ),
        body: Obx(()=>
        liveController.isLoading.value?
            Center(child: CustomLoading()):
            !liveController.shouldCallApi()?
           Center(
             child: CustomText(text: 'today_is_holiday'.tr),
           )     :
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    liveController.liveData?.twod ?? "--",
                    style: TextStyle(
                        shadows: const <Shadow>[
                          Shadow(
                            offset: Offset(5.0, 5.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                        fontSize: 70.sp,
                        color: secondaryColor,
                        fontWeight: FontWeight.bold),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.history_toggle_off,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Obx(()=>
                          Text(
                            "${'updated_at'.tr} ${liveController.updateTime.split(".")[0]}",
                            style:  TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: liveController.resultData?.length ??
                          0, // Use '0' if null to avoid exceptions
                      itemBuilder: (context, index) {
                        String openTime =
                            liveController.resultData?[index].openTime ?? "--";

                        DateTime? dateTime;
                        String formattedTime = "Invalid Time"; // Default value

                        // Check if openTime is valid before parsing
                        if (openTime != "--" && openTime.isNotEmpty) {
                          try {
                            DateFormat inputFormat = DateFormat('HH:mm:ss');
                            dateTime = inputFormat.parse(openTime);
                            // Format the DateTime in 12-hour format
                            formattedTime =
                                DateFormat('hh:mm a').format(dateTime);
                          } catch (e) {
                            // Log or handle the exception if parsing fails
                            print(
                                "Failed to parse openTime: $openTime. Error: $e");
                          }
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 5,
                              surfaceTintColor: Colors.white,
                              color: (index % 2 != 0)
                                  ? secondaryColor
                                  : secondaryColor.withOpacity(0.6),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      formattedTime,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor),
                                    ),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Opacity(
                                              opacity: 0.5,
                                              child: Text("Set",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: whiteColor)),
                                            ),
                                            Text(
                                              liveController.resultData?[index]
                                                      .resultSet ??
                                                  "--",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: whiteColor),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Opacity(
                                              opacity: 0.5,
                                              child: Text("Value",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: whiteColor)),
                                            ),
                                            Text(
                                              liveController
                                                      .resultData?[index].value ??
                                                  "--",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: whiteColor),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Opacity(
                                              opacity: 0.5,
                                              child: Text("2D",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: whiteColor)),
                                            ),
                                            Text(
                                              liveController
                                                      .resultData?[index].twod ??
                                                  "--",
                                              style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  )


                ],
              ),
            ),
          ),
        ));
  }
}
