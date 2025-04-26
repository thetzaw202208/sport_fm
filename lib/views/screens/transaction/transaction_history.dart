import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/transaction_history_controller.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/utils/dimen_const.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionHistoryController tController =
        Get.put(TransactionHistoryController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'history'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(
          () => (tController.detailData.isNotEmpty == true)
              ? ListView.builder(
                  itemCount: tController.detailData.length,
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

                                      (tController.detailData[index].type=='deposit')?   CustomText(
                                          fontWeight: FontWeight.bold,

                                          text:
                                              (tController.detailData[index].type??'').toUpperCase()):
                                      Row(
                                        children: [
                                          CustomText(
                                              fontWeight: FontWeight.bold,
                                          
                                              text:
                                              "${(tController.detailData[index].type??'').toUpperCase()} To "),
                                          CustomText(text: (tController.detailData[index].userAccountName??'').toUpperCase(),color: red,)
                                        ],
                                      ),
                                     if(tController.detailData[index].type!='deposit') CustomText(text: (tController.detailData[index].userAccount??'')),
                                      CustomText(
                                          color: grey.withOpacity(0.5),
                                          text: ((tController.detailData[index].requestedDate??"").split(".")[0]).replaceAll("T", " ")),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                      text: (tController.detailData[index].bankType??"").toUpperCase(),
                                  color: grey,),
                                  CustomText(
                                    fontSize: 16.sp,
                                     color: (tController.detailData[index].type=='deposit')?green:red,
                                      text: (tController.detailData[index].type ==
                                              'deposit')
                                          ? "+${tController.detailData[index].amount} MMK"
                                          : "-${tController.detailData[index].amount} MMK"),
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
