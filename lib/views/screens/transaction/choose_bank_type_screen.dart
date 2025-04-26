import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/wallet_controller.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/utils/dimen_const.dart';
import 'package:sport_fm/views/screens/transaction/deposit_screen.dart';
import 'package:sport_fm/views/screens/transaction/withdraw_screen.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';

class ChooseBankScreen extends StatelessWidget {
  const ChooseBankScreen({super.key, required this.fromScreen});

  final String fromScreen;

  @override
  Widget build(BuildContext context) {
    final wCont = Get.put(WalletController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
            text: (fromScreen == 'd') ? ('deposit'.tr) : ('withdraw'.tr)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomText(
              text: 'notices'.tr,
              color: red,
              fontWeight: FontWeight.bold,
            ),
            kSizedBoxH10,
            CustomText(text:(fromScreen=='d')? 'notice_info'.tr : 'withdraw_info'.tr,maxLines: 5,),
            kSizedBoxH25,
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            wCont.getBankAcc('wavepay');
                            (fromScreen == 'd')
                                ? Get.to(DepositScreen(
                                    payType: 'wavepay',
                                  ))
                                : Get.to(WithdrawScreen(
                                    payType: 'wavepay',
                                  ));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(5),
                            elevation: 5,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.asset(
                                      'assets/images/waveMoney.png',
                                      width: 80.w,
                                      height: 80.h,
                                    ),
                                    Container(
                                        width: 150.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.7),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                        child: Center(
                                          child: CustomText(
                                            text: 'waveMoney'.tr,
                                            color: whiteColor,
                                          ),
                                        ))
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            wCont.getBankAcc('kpay');
                            (fromScreen == 'd')
                                ? Get.to(DepositScreen(
                                    payType: 'kpay',
                                  ))
                                : Get.to(WithdrawScreen(
                                    payType: 'kpay',
                                  ));
                            //data.selectPayment(index, context,data.paymentList[index].id,data.paymentList[index].imgPath,data.paymentList[index].name);
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(5),
                            elevation: 5,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.asset(
                                      'assets/images/kbzPay.png',
                                      width: 80.w,
                                      height: 80.h,
                                    ),
                                    Container(
                                        width: 150.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.7),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                        child: Center(
                                          child: CustomText(
                                            text: 'kPay'.tr,
                                            color: whiteColor,
                                          ),
                                        ))
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     // Padding(
                  //     //   padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
                  //     //   child: GestureDetector(
                  //     //     onTap: () {
                  //     //       //data.selectPayment(index, context,data.paymentList[index].id,data.paymentList[index].imgPath,data.paymentList[index].name);
                  //     //     },
                  //     //     child: Material(
                  //     //       borderRadius: BorderRadius.circular(5),
                  //     //       elevation: 5,
                  //     //       child: Container(
                  //     //           decoration: BoxDecoration(
                  //     //               border: Border.all(color: Colors.green),
                  //     //               borderRadius: BorderRadius.circular(5)),
                  //     //           child: Column(
                  //     //             mainAxisAlignment:
                  //     //             MainAxisAlignment.spaceBetween,
                  //     //             children: [
                  //     //               const SizedBox(height: 5,),
                  //     //               Image.asset(
                  //     //                 'assets/images/ayaPay.png',
                  //     //                 width: 80.w,
                  //     //                 height: 80.h,
                  //     //               ),
                  //     //               Container(
                  //     //                   width: 150.w,
                  //     //                   height: 30.h,
                  //     //                   decoration: BoxDecoration(
                  //     //                       color: Colors.green.withOpacity(0.7),
                  //     //                       borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))),
                  //     //                   child: Center(
                  //     //                     child: CustomText(
                  //     //                       text:'ayaPay'.tr,
                  //     //
                  //     //                     ),
                  //     //                   ))
                  //     //             ],
                  //     //           )),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           //data.selectPayment(index, context,data.paymentList[index].id,data.paymentList[index].imgPath,data.paymentList[index].name);
                  //         },
                  //         child: Material(
                  //           borderRadius: BorderRadius.circular(5),
                  //           elevation: 5,
                  //           child: Container(
                  //               decoration: BoxDecoration(
                  //                   border: Border.all(color: Colors.green),
                  //                   borderRadius: BorderRadius.circular(5)),
                  //               child: Column(
                  //                 mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   const SizedBox(height: 5,),
                  //                   Image.asset(
                  //                     'assets/images/kbzBank.png',
                  //                     width: 80.w,
                  //                     height: 80.h,
                  //                   ),
                  //                   Container(
                  //                       width: 150.w,
                  //                       height: 30.h,
                  //                       decoration: BoxDecoration(
                  //                           color: Colors.green.withOpacity(0.7),
                  //                           borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))),
                  //                       child: Center(
                  //                         child: CustomText(
                  //                           text:'kbzBanking',
                  //
                  //                         ),
                  //                       ))
                  //                 ],
                  //               )),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
