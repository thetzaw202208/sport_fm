import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/betting_controller.dart';
import 'package:sport_fm/controller/two_d_history_controller.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';

import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';

class TwoDHistoryScreen extends StatelessWidget {
  const TwoDHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tController = Get.put(TwoDHisController());
    //tController.getTwoDHisData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'history'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(
              () => (tController.hList.isNotEmpty == true)
              ? ListView.builder(
              itemCount: tController.hList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              Icon(Icons.currency_exchange,size: 20,color: secondaryColor,),
                              kSizedBoxW5,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                    CustomText(
                                      color: grey,

                                      text:'bet_number'.tr
                                     ),

                                  CustomText(
                                      fontWeight: FontWeight.bold,

                                      text:
                                      (tController.hList[index].betNumber??'')),

                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                  color: grey.withOpacity(0.5),
                                  text: ((tController.hList[index].createdAt??"").split(".")[0]).replaceAll("T", " ")),
                              CustomText(
                                  fontSize: 16.sp,
                                  color: red,
                                  text: "-${tController.hList[index].betAmount} MMK"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
              : Center(
            child: CustomText(text: 'no_transaction'.tr),
          ),
        ),
      ),
    );
  }
}
