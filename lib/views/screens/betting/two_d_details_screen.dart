import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/betting_controller.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/views/widgets/custom_button.dart';
import 'package:sport_fm/views/widgets/custom_loading.dart';
import 'package:sport_fm/views/widgets/custom_text_form_field.dart';

import '../../../utils/dimen_const.dart';
import '../../widgets/custom_text.dart';

class TwoDDetailsScreen extends StatelessWidget {
  const TwoDDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BettingController twoDController = Get.put(BettingController());
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () =>
          (twoDController.closeWidget.value)?
              Center(
                child: CustomText(text: 'close_time'.tr,maxLines: 5,),
              ):
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: twoDController.twoDList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return Obx(()=>
                      GestureDetector(
                        onTap: () {
                          //twoDController.selectNumbers(index);
twoDController.selectedNumber.contains(index)?
twoDController.selectNumbers(index):
                          Get.defaultDialog(

                            // backgroundColor: whiteColor,
title: 'amount'.tr,
                           content:  Container(
                              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*.7,
                                      child: CustomTextFormField(
                                        controller: twoDController.amountText,
                                        keyBoardType: TextInputType.number,
                                          hintText: 'enter_amount'.tr, isValidate: false)),
                                  kSizedBoxH10,
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*.2,
                                      child: CustomButton(text: 'confirm'.tr, onTap: (){
                                        if(twoDController.amountText.text.isNotEmpty) {
                                          Get.back();
                                          twoDController.selectBetNumbers(index,twoDController.amountText.text);

                                        }

                                      }))
                                ],
                              ),
                            )
                          );
                        },
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(5),
                          // shape: const RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.only(
                          //       topLeft: Radius.circular(5.0),
                          //       topRight: Radius.circular(5.0),
                          //       bottomLeft: Radius.circular(5.0),
                          //       bottomRight: Radius.circular(5.0)),
                          // ),
                          child: Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: twoDController.selectedNumber.contains(index)
                                    ? const Color.fromARGB(255, 236, 196, 64)
                                    : Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0))),
                            //child: Card(
                            // surfaceTintColor: Colors.white,
                            // borderOnForeground: false,
                            // color: twoDController.selectedNumber.contains(index)
                            //     ? const Color.fromARGB(255, 236, 196, 64)
                            //     : Colors.white,
                            // shadowColor: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                kSizedBoxH5,
                                Obx(
                                      () => Text(
                                    twoDController.twoDList[index].betNumber
                                        .toString(),
                                    style: TextStyle(
                                        color: twoDController.selectedNumber
                                            .contains(index)
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                LinearProgressIndicator(
                                  backgroundColor: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  value: 1,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      (((twoDController.twoDList[index]
                                          .leftAmount ??
                                          0) /
                                          (twoDController
                                              .twoDList[index]
                                              .limitedAmount ??
                                              0)) <
                                          0.5 &&
                                          ((twoDController.twoDList[index]
                                              .leftAmount ??
                                              0) /
                                              (twoDController
                                                  .twoDList[index]
                                                  .limitedAmount ??
                                                  0)) >
                                              0.3)
                                          ? Colors.yellow
                                          : ((twoDController.twoDList[index]
                                          .leftAmount ??
                                          0) /
                                          (twoDController
                                              .twoDList[index]
                                              .limitedAmount ??
                                              0)) <
                                          0.3
                                          ? Colors.red
                                          : Colors.green),
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            // )
                          ),
                        ),
                      ),
                  );
                }),
          ),
        ),
    bottomNavigationBar: Obx(()=>

     twoDController.isLoading.value?
         Center(child: CustomLoading(),):

      Padding(
          padding: EdgeInsets.all(10.w),
        child: Visibility(
          visible: !twoDController.closeWidget.value,
          child: CustomButton(text: 'confirm'.tr, onTap: (){
            (twoDController.betNumberList.isNotEmpty)?
                twoDController.twoDBetConfirm(twoDController.betNumberList):
            Get.snackbar('Warning', 'please_select_number'.tr)
            ;
          }),
        ),
      ),
    ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:sport_fm/controller/betting_controller.dart';
// import 'package:sport_fm/utils/color_const.dart';
// import 'package:sport_fm/views/widgets/custom_button.dart';
// import 'package:sport_fm/views/widgets/custom_loading.dart';
// import 'package:sport_fm/views/widgets/custom_text_form_field.dart';
//
// import '../../../utils/dimen_const.dart';
//
// class TwoDDetailsScreen extends StatelessWidget {
//   const TwoDDetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     BettingController twoDController = Get.put(BettingController());
//     return Scaffold(
//       appBar: AppBar(),
//       body: Obx(
//             () => Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GridView.builder(
//             itemCount: twoDController.twoDList.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 5,
//               childAspectRatio: 1,
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 20,
//             ),
//             itemBuilder: (context, index) {
//               return Obx(
//                     () => GestureDetector(
//                   onTap: () {
//                     if (twoDController.selectedNumber.contains(index)) {
//                       twoDController.selectNumbers(index);
//                     } else {
//                       Get.defaultDialog(
//                        content:  Container(
//                           color: whiteColor,
//                           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width * 0.7,
//                                 child: CustomTextFormField(
//                                   controller: twoDController.amountText,
//                                   keyBoardType: TextInputType.number,
//                                   hintText: 'enter_amount'.tr,
//                                   isValidate: false,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width * 0.2,
//                                 child: CustomButton(
//                                   text: 'confirm'.tr,
//                                   onTap: () {
//                                     // Validate and then dismiss the BottomSheet
//                                     if (twoDController.amountText.text.isNotEmpty) {
//                                       twoDController.selectBetNumbers(index, twoDController.amountText.text);
//                                       Get.back(); // This dismisses the BottomSheet
//                                     } else {
//                                       // Optionally show a message if the input is invalid
//                                       Get.snackbar('Warning', 'Please enter an amount.');
//                                     }
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                   child: Material(
//                     elevation: 10,
//                     borderRadius: BorderRadius.circular(5),
//                     child: Container(
//                       width: 50.w,
//                       height: 50.h,
//                       decoration: BoxDecoration(
//                         color: twoDController.selectedNumber.contains(index) ?
//                         const Color.fromARGB(255, 236, 196, 64) :
//                         Colors.white,
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           kSizedBoxH5,
//                           Obx(
//                                 () => Text(
//                               twoDController.twoDList[index].betNumber.toString(),
//                               style: TextStyle(
//                                 color: twoDController.selectedNumber.contains(index) ?
//                                 Colors.white :
//                                 Colors.black,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           LinearProgressIndicator(
//                             backgroundColor: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             value: 1,
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                               // Use a color based on your logic
//                                 (((twoDController.twoDList[index].leftAmount ?? 0) /
//                                     (twoDController.twoDList[index].limitedAmount ?? 0)) < 0.5 &&
//                                     ((twoDController.twoDList[index].leftAmount ?? 0) /
//                                         (twoDController.twoDList[index].limitedAmount ?? 0)) > 0.3)
//                                     ? Colors.yellow
//                                     : (((twoDController.twoDList[index].leftAmount ?? 0) /
//                                     (twoDController.twoDList[index].limitedAmount ?? 0)) < 0.3)
//                                     ? Colors.red
//                                     : Colors.green),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       bottomNavigationBar: Obx(
//             () => twoDController.isLoading.value
//             ? Center(child: CustomLoading())
//             : Padding(
//           padding: EdgeInsets.all(10.w),
//           child: CustomButton(
//             text: 'confirm'.tr,
//             onTap: () {
//               if (twoDController.betNumberList.isNotEmpty) {
//                 twoDController.twoDBetConfirm(twoDController.betNumberList);
//               } else {
//                 Get.snackbar('Warning', 'please_select_number'.tr);
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }