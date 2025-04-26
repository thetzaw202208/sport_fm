import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/wallet_controller.dart';
import 'package:sport_fm/utils/color_const.dart';
import 'package:sport_fm/utils/dimen_const.dart';
import 'package:sport_fm/views/widgets/custom_button.dart';
import 'package:sport_fm/views/widgets/custom_loading.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';
import 'package:sport_fm/views/widgets/custom_text_form_field.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key, required this.payType});
final String payType;
  @override
  Widget build(BuildContext context) {
    WalletController walletController = Get.put(WalletController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: ListView(
          children: [
            Image.asset(
             payType=='wavepay'? 'assets/images/waveMoney.png': 'assets/images/kbzPay.png',
              width: 70,
              height: 70,
            ),

            const DottedLine(),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: secondaryColor.withOpacity(0.6),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: CustomText(
color: whiteColor,
                  text: 'deposit_info'.tr,
                  maxLines: 5,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomText(
                  text:payType=='wavepay'?'wavepayAccount'.tr: "kpayAccount ".tr,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: walletController.bankAccResult.bankAccountNo,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    // data.onTapCopyIcon();
                    // await Clipboard.setData(
                    //     ClipboardData(
                    //         text:
                    //         "${data.phoneNumber}"));

                    // data.showToastMsg(
                    //     "Copied to clipboard",context);
                  },
                  child: Image.asset(
                    'assets/images/clipboard_copy.png',
                    color: Colors.green,
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                //if(data.onTapCopy) Text(LocaleKeys.kCopied.tr(),style: copyTextStyle,),
              ],
            ),
            kSizedBoxH10,
            Row(
              children: [
                CustomText(
                  text:payType=='wavepay'?'wavepayAccount_name'.tr: "kpayAccount_name".tr,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: walletController.bankAccResult.bankAccountName,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ],
            ),
            kSizedBoxH10,
            //amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'amount'.tr),
                SizedBox(
                  width: 220.w,
                  child: CustomTextFormField(
                      controller: walletController.amountText,
                      keyBoardType: TextInputType.number,
                      hintText: '',
                      isValidate: false),
                )
              ],
            ),
            kSizedBoxH10,
            //acc
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'account'.tr),
                SizedBox(
                  width: 220.w,
                  child: CustomTextFormField(
                      controller: walletController.userAccText,
                      keyBoardType: TextInputType.number,
                      hintText: '',
                      isValidate: false),
                )
              ],
            ),
            kSizedBoxH10,
            //accname
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'acc_name'.tr),
                SizedBox(
                  width: 220.w,
                  child: CustomTextFormField(
                      controller: walletController.userAccNameText,
                      hintText: '',
                      isValidate: false),
                )
              ],
            ),
            kSizedBoxH10,
            //trans
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'trans_no'.tr),
                SizedBox(
                  width: 220.w,
                  child: CustomTextFormField(
                      keyBoardType: TextInputType.number,
                      controller: walletController.transNoText,
                      hintText: '',
                      isValidate: false),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.w),
        child: Obx(()=>
         walletController.isConfirmLoading.value?
         Center(child: CustomLoading()):
         CustomButton(
              text: 'confirm'.tr,
              onTap: () {
                if(walletController.transNoText.text.isNotEmpty) {
                  walletController.depositConfirm(
                    walletController.amountText.text,
                    walletController.userAccText.text,
                    walletController.userAccNameText.text,
                    walletController.transNoText.text);
                }
              }),
        ),
      ),
    );
  }
}
