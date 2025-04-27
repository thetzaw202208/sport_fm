import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/get_new_token_controller.dart';
import 'package:sport_fm/response_model/betting_confirm_response_vo.dart';
import 'package:sport_fm/response_model/two_d_history_vo.dart';
import 'package:sport_fm/response_model/two_d_numbers_vo.dart';
import 'package:sport_fm/services/local_storage.dart';
import 'package:sport_fm/views/screens/bottom_nav_menu.dart';

import '../models/bet_request_vo.dart';
import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';

class BettingController extends GetxController{
  TwoDNumbersVo twoDNumbers=TwoDNumbersVo();
  TwoDHistoryVo twoDHistoryVo=TwoDHistoryVo();
  BetConfirmVo twoDBetConfirmResult=BetConfirmVo();
  RxBool isLoading=false.obs;
  LocalStorage box=LocalStorage();
  RxList<int> selectedNumber = <int>[].obs;
  RxList<BetRequestVo> betNumberList = <BetRequestVo>[].obs;
  RxList<Data> twoDList=<Data>[].obs;
  RxList<DetailData> hList=<DetailData>[].obs;
  TextEditingController amountText=TextEditingController();
  RxBool closeWidget=false.obs;

  @override
  void onInit() {
    getTwoDData();
    //getTwoDHisData();
   ////print('get two d data call');
    super.onInit();
  }
  selectNumbers(int index) {

      selectedNumber.remove(index);
      betNumberList.removeAt(index);
      Get.snackbar("Success", "Number removed Successfully");

  }
  selectBetNumbers(int index,String amount) {

      selectedNumber.add(index);
      betNumberList.add(BetRequestVo(
          number:  int.parse(twoDList[index].betNumber??'11'),
          amount:int.parse(amount)
      ));
      //print("Number list ${betNumberList[0].number} and length ${betNumberList.length}");
      Get.snackbar("Success", "Number added Successfully");
      amountText.text="";



  }

  void betClear(){
    betNumberList.value=[];
    selectedNumber.value=[];
  }
  Future<void> twoDBetConfirm(List<BetRequestVo> betList) async {
    isLoading.value = true;
    try {
      ////print('get three d data start');
      twoDBetConfirmResult = await ApiRepo().twoDBettingConfirm(betList);
      if (twoDBetConfirmResult.status == 200) {
        betClear();
        //print('get three d data success');
        isLoading.value = false;
        Get.offAll(BottomNavMenu());
        //Get.snackbar("Success", twoDBetConfirmResult.message??"");
      } else if (twoDBetConfirmResult.status == 401) {
        betClear();
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        twoDBetConfirm(betList);
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: (){
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     }
        // );

      } else {
        betClear();
        Get.snackbar("Fail", twoDBetConfirmResult.message??"");
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getTwoDData() async {
    isLoading.value = true;
    try {
      //print('get two d data start');
      twoDNumbers = await ApiRepo().getTwoDNumbers();
      if (twoDNumbers.success == 200) {
        twoDList.value=twoDNumbers.data??<Data>[];
        //print('get two d data success');
        isLoading.value = false;
       // Get.snackbar("Profile Success", "Your login process is success");
      } else if (twoDNumbers.success == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getTwoDData();
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: (){
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     }
        // );

      }else if (twoDNumbers.success == 404) {
        closeWidget.value=true;
        // closeWidget = CustomText(text: 'close_time'.tr,maxLines: 5,);
        // Get.defaultDialog(
        //     title: 'warning'.tr,
        //     content: CustomText(text: 'close_time'.tr,maxLines: 5,),
        //     onConfirm: (){
        //       Get.back();
        //       // box.write('isLogin', false);
        //       // box.remove('accessKey');
        //       // box.remove('refreshKey');
        //       // Get.offAll(LoginScreen());
        //     }
        // );

      } else {
        Get.snackbar("Fail", "Your process is failed");
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getTwoDHisData() async {
    isLoading.value = true;
    try {
      ////print('get three d data start');
      twoDHistoryVo = await ApiRepo().getTwoDBetHistory();
      if (twoDHistoryVo.status == 200) {
        hList.value=twoDHistoryVo.resData?.detailData??[];
        //print('get three d data success');
        isLoading.value = false;
        //Get.snackbar("three d Success", "Your login process is success");
      } else if (twoDHistoryVo.status == 401) {
       var getNewT= Get.put(GetNewTokenController());
       getNewT.getNewToken();
       getTwoDHisData();
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: (){
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     }
        // );

      }else {
        Get.snackbar("Fail", "Your process is failed");
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}