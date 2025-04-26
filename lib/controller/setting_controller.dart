import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_fm/controller/bottom_nav_controller.dart';
import 'package:sport_fm/response_model/logout_response_vo.dart';
import 'package:sport_fm/services/local_storage.dart';
import 'package:sport_fm/views/screens/login/login_screen.dart';
import 'package:sport_fm/views/widgets/custom_text.dart';

import '../response_model/profile_response_vo.dart';
import '../services/api_repo.dart';
import '../utils/constants.dart';
import 'get_new_token_controller.dart';

class SettingController extends GetxController {
  // initializing with the current theme of the device
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;
  ProfileResponseVo result = ProfileResponseVo();
  LogoutResponseVo resultLogout = LogoutResponseVo();
  RxBool isLoading = false.obs;
  RxBool isObscure = false.obs;
  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString userID = ''.obs;
  RxString balance = ''.obs;
  LocalStorage box = LocalStorage();
  RxString avatar = 'a1'.obs;
  @override
  void onInit() {
    print('setting controller is not work');
    getProfileData();
    getAvatar();

    super.onInit();
  }
  void setVisibleOnOff(){
    if(isObscure.value==true){
      isObscure.value=false;
    }else{
      isObscure.value=true;
    }
  }
  getAvatar() {
    // _timer=Timer.periodic(Duration(seconds: 1), (va){
    //   print('Timer is work');
    avatar.value = box.read('avatar') ?? 'a1';
    //});
  }

  Future<void> goLogoutFun() async{
    isLoading.value=true;
    try {
      resultLogout = await ApiRepo().goLogout();
      if (resultLogout.status == 200) {

        isLoading.value = false;
        box.write('isLogin', false);
        box.clear();
        Get.offAll(LoginScreen());
        Get.snackbar("Logout Success", "Your logout process is success");
      } else if (resultLogout.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        goLogoutFun();
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
        Get.snackbar("Logout Fail", "Your logout process is failed");
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getProfileData() async {
    isLoading.value = true;
    try {
      print('AccessKey ${box.read('accessKey')}');
      result = await ApiRepo().getProfileData();
      if (result.status == 200) {
        name.value = result.data?.name ?? "";
        phone.value = result.data?.phone ?? "";
        userID.value = result.data?.id ?? "";
        balance.value = result.data?.balance ?? "";
        isLoading.value = false;
        //Get.snackbar("Profile Success", "Your login process is success");
      } else if (result.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getProfileData();
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
        Get.snackbar("Fail", "Your process is failed");
      }
    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void changeAvatarFun(String av) {
    box.write('avatar', av);
    avatar.value = av;
    Get.back();
  }

  // function to switch between themes
  void switchTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
