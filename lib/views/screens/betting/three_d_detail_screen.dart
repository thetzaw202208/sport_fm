import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/three_d_controller.dart';
import 'package:sport_fm/utils/dimen_const.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_loading.dart';
import '../../widgets/custom_text_form_field.dart';

class ThreeDDetailsScreen extends StatelessWidget {
  const ThreeDDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThreeDController threeDController = Get.put(ThreeDController());
    return Scaffold(
        appBar: AppBar(),
        body:
    Obx(
              () => Padding(
                padding:  EdgeInsets.all(5.w),
                child: GridView.builder(
                itemCount: threeDController.threeDList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return Obx(()=>
                      GestureDetector(
                        onTap: () {
                          //threeDController.selectNumbers(index);
                          threeDController.selectedNumber.contains(index)?
                          threeDController.selectNumbers(index):
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
                                            controller: threeDController.amount3DText,
                                            keyBoardType: TextInputType.number,
                                            hintText: 'enter_amount'.tr, isValidate: false)),
                                    kSizedBoxH10,
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width*.4,
                                        child: CustomButton(text: 'confirm'.tr, onTap: (){
                                          if(threeDController.amount3DText.text.isNotEmpty) {
                                            Get.back();
                                            threeDController.selectBetNumbers(index,threeDController.amount3DText.text);

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
                                  color: threeDController.selectedNumber.contains(index)
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
                                // color: threeDController.selectedNumber.contains(index)
                                //     ? const Color.fromARGB(255, 236, 196, 64)
                                //     : Colors.white,
                                // shadowColor: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    kSizedBoxH5,
                                    Obx(
                                          () => Text(
                                        threeDController.threeDList[index].betNumber
                                            .toString(),
                                        style: TextStyle(
                                            color: threeDController.selectedNumber
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
                                          (((threeDController.threeDList[index]
                                              .leftAmount ??
                                              0) /
                                              (threeDController
                                                  .threeDList[index]
                                                  .limitedAmount ??
                                                  0)) <
                                              0.5 &&
                                              ((threeDController.threeDList[index]
                                                  .leftAmount ??
                                                  0) /
                                                  (threeDController
                                                      .threeDList[index]
                                                      .limitedAmount ??
                                                      0)) >
                                                  0.3)
                                              ? Colors.yellow
                                              : ((threeDController.threeDList[index]
                                              .leftAmount ??
                                              0) /
                                              (threeDController
                                                  .threeDList[index]
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
    threeDController.isLoading.value?
    Center(child: CustomLoading(),):
    Padding(
    padding: EdgeInsets.all(10.w),
    child: CustomButton(text: 'confirm'.tr, onTap: (){
    (threeDController.betNumberList.isNotEmpty)?
    threeDController.threeDBetConfirmFun(threeDController.betNumberList):
    Get.snackbar('Warning', 'please_select_number'.tr)
    ;
    }),
    ),
    ));
  }
}
