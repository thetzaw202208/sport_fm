import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sport_fm/response_model/login_response_vo.dart';
import 'package:sport_fm/services/api_repo.dart';
import 'package:sport_fm/services/local_storage.dart';
import 'package:sport_fm/views/screens/bottom_nav_menu.dart';

import '../utils/constants.dart';
import '../views/screens/login/login_screen.dart';
import '../views/widgets/custom_text.dart';

class LoginController extends GetxController{
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isLoginLoading = false.obs;
  RxBool isObscure = true.obs;
  RxBool isChecked = false.obs;
  RxBool isTextEmpty=true.obs;
  RxBool isPwdTextEmpty=true.obs;
LocalStorage box=LocalStorage();
  LoginResponseVo result = LoginResponseVo();


  void onChangeTextField(String text){
    if(text.isEmpty){
      isTextEmpty.value=true;
    }else{
      isTextEmpty.value=false;
    }
  }

void onChangePwdTextField(String text){
  if(text.isEmpty){
    isPwdTextEmpty.value=true;
  }else{
    isPwdTextEmpty.value=false;
  }
}

  void setVisibleOnOff(){
    if(isObscure.value==true){
      isObscure.value=false;
    }else{
      isObscure.value=true;
    }
  }

  void setCheck(){
    if(isChecked.value==true){
      isChecked.value=false;
    }else{
      isChecked.value=true;
    }
  }
  Future<void> doLogin(String phoneNumber,String password) async {
    isLoginLoading.value = true;
    try {
       result = await ApiRepo().goLogin(phoneNumber, password);
      if (result.status == 200) {
       
        box.write('isLogin', true);
        box.write('accessKey', result.accessToken);
        box.write('refreshKey', result.refreshToken);
        print('Here is accessKey ${box.read('accessKey')}');
        print('Here is accessKey ${result.accessToken}');
        Future.delayed(Duration(seconds: 2),(){
          isLoginLoading.value=false;
          Get.offAll(BottomNavMenu());
        });

        //Get.snackbar("Login Success", "Your login process is success");
      }
      else if (result.status == 401) {
        Get.snackbar("Login Fail",'invalid_credential'.tr);

      }else{
        Get.snackbar("Login Fail", "Your login process is failed");
        isLoginLoading.value = false;
      }

    } catch (e) {
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
     // isLoginLoading.value = false;
    }
  }
}