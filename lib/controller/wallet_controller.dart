import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sport_fm/response_model/deposit_response_vo.dart';
import 'package:sport_fm/response_model/get_bank_acc_response_vo.dart';
import 'package:sport_fm/services/local_storage.dart';
import 'package:sport_fm/views/screens/bottom_nav_menu.dart';
import 'package:sport_fm/views/screens/transaction/success_screen.dart';

import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../views/screens/login/login_screen.dart';
import '../views/widgets/custom_text.dart';
import 'get_new_token_controller.dart';

class WalletController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isConfirmLoading = false.obs;
  DepositResponseVo depositResult = DepositResponseVo();
  DepositResponseVo withdrawResult = DepositResponseVo();
  GetBankAccResponseVo bankAccResult = GetBankAccResponseVo();
  TextEditingController amountText = TextEditingController();
  TextEditingController userAccText = TextEditingController();
  TextEditingController userAccNameText = TextEditingController();

  TextEditingController amountWText = TextEditingController();
  TextEditingController userAccWText = TextEditingController();
  TextEditingController userAccNameWText = TextEditingController();
  TextEditingController transNoText = TextEditingController();
  LocalStorage box = LocalStorage();

  @override
  void onInit() {

    super.onInit();
  }

  Future<void> getBankAcc(String bankType) async {
    try {
      bankAccResult = await ApiRepo().getBankAcc(bankType);
      if (bankAccResult.status == 200) {
        box.write('bankAccId', bankAccResult.bankAccountId);
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr,maxLines: 5,),
        //     onConfirm: () {
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     });
        //Get.snackbar("Bank acc get Success", "Your login process is success");
      } else if (bankAccResult.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getBankAcc(bankType);
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: () {
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     });
      }  else {
        Get.snackbar("Fail", "Your process is failed");
      }
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> depositConfirm(String amount, String userAcc, String userAccName,
      String transNumber) async {
    var bankAccId = box.read('bankAccId');
    isConfirmLoading.value=true;
    try {
      depositResult = await ApiRepo()
          .doDeposit(bankAccId, amount, userAcc, userAccName, transNumber);
      if (depositResult.status == 200) {
        Get.snackbar("Deposit Success", depositResult.message ?? "");
        Get.offAll(SuccessScreen());
      } else if (depositResult.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        depositConfirm(amount, userAcc, userAccName, transNumber);
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: () {
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     });
      } else {
        Get.snackbar("Fail", "Your process is failed");
      }
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isConfirmLoading.value = false;
    }
  }
  Future<void> withdrawConfirm(String amount, String userAcc, String userAccName,
      String payType) async {

    isConfirmLoading.value=true;
    try {
      withdrawResult = await ApiRepo()
          .doWithdraw( amount, userAcc, userAccName, payType);
      if (withdrawResult.status == 200) {
        //Get.snackbar("Withdraw Success", depositResult.message ?? "");
        Get.offAll(SuccessScreen());
      }  else if (withdrawResult.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        withdrawConfirm(amount, userAcc, userAccName, payType);
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: () {
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     });
      } else {
        Get.snackbar("Fail", "Your process is failed");
      }
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isConfirmLoading.value = false;
    }
  }
}
