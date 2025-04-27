import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_fm/response_model/two_d_numbers_vo.dart';
import 'package:sport_fm/services/local_storage.dart';

import '../models/bet_request_vo.dart';
import '../response_model/betting_confirm_response_vo.dart';
import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../views/widgets/custom_text.dart';
import 'get_new_token_controller.dart';

class ThreeDController extends GetxController {
  TwoDNumbersVo threeDNumbers = TwoDNumbersVo();
  RxBool isLoading = false.obs;
  LocalStorage box = LocalStorage();
  RxList<int> selectedNumber = <int>[].obs;

  RxList<Data> threeDList = <Data>[].obs;

  BetConfirmVo threeDBetConfirmResult = BetConfirmVo();
  TextEditingController amount3DText = TextEditingController();
  RxList<BetRequestVo> betNumberList = <BetRequestVo>[].obs;

  @override
  void onInit() {
    getThreeDData();
    //print('get two d data call');
    super.onInit();
  }

  selectNumbers(int index) {
    selectedNumber.remove(index);
    betNumberList.removeAt(index);
    Get.snackbar("Success", "Number removed Successfully");
  }

  selectBetNumbers(int index, String amount) {
    selectedNumber.add(index);
    betNumberList.add(BetRequestVo(
        number: int.parse(threeDList[index].betNumber ?? '11'),
        amount: int.parse(amount)));
    //print(
       // "Number list ${betNumberList[0].number} and length ${betNumberList.length}");
    Get.snackbar("Success", "Number added Successfully");
    amount3DText.text = "";
  }

  void betClear() {
    betNumberList.value = [];
    selectedNumber.value = [];
  }

  Future<void> threeDBetConfirmFun(List<BetRequestVo> betList) async {
    isLoading.value = true;
    try {
      ////print('get three d data start');
      threeDBetConfirmResult = await ApiRepo().threeDBettingConfirm(betList);
      if (threeDBetConfirmResult.status == 200) {
        betClear();
        //print('get three d data success');
        isLoading.value = false;
        Get.snackbar("Success", threeDBetConfirmResult.message ?? "");
      } else if (threeDBetConfirmResult.status == 401) {
        betClear();
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        threeDBetConfirmFun(betList);
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: () {
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     });
      } else if (threeDBetConfirmResult.status == 404) {
        betClear();
        Get.defaultDialog(
            title: 'warning'.tr,
            content: CustomText(text: 'close_time'.tr,maxLines: 5),
            onConfirm: () {
              Get.back();
              // box.write('isLogin', false);
              // box.remove('accessKey');
              // box.remove('refreshKey');
              // Get.offAll(LoginScreen());
            });
      } else {
        betClear();
        Get.snackbar("Fail", threeDBetConfirmResult.message ?? "");
      }
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getThreeDData() async {
    isLoading.value = true;
    try {
      //print('get three d data start');
      threeDNumbers = await ApiRepo().getThreeDNumbers();
      if (threeDNumbers.success == 200) {
        threeDList.value = threeDNumbers.data ?? [];
        //print('get three d data success');
        isLoading.value = false;
       // Get.snackbar("three d Success", "Your login process is success");
      }  else if (threeDBetConfirmResult.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getThreeDData();
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: () {
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     });
      }  else if (threeDNumbers.success == 404) {
        Get.defaultDialog(
            title: 'warning'.tr,
            content: CustomText(text: 'close_time'.tr,maxLines: 5),
            onConfirm: () {
              Get.back();
              // box.write('isLogin', false);
              // box.remove('accessKey');
              // box.remove('refreshKey');
              // Get.offAll(LoginScreen());
            });
      } else {
        Get.snackbar("Fail", "Your process is failed");
      }
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}
