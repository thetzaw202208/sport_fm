import 'package:get/get.dart';
import 'package:sport_fm/response_model/rule_response_vo.dart';
import 'package:flutter/material.dart';
import 'package:sport_fm/services/local_storage.dart';
import '../services/api_repo.dart';
import '../utils/constants.dart';
import 'get_new_token_controller.dart';

class PrivacyPolicyController extends GetxController {
  RuleResponseVo result = RuleResponseVo();
  RxBool isLoading = false.obs;
  RxString ruleData = ''.obs;
  LocalStorage box = LocalStorage();
  @override
  void onInit() {
    getRule();
    super.onInit();
  }

  Future<void> getRule() async {
    try {
      result = await ApiRepo().getPrivacyPolicy();
      if (result.status == 200) {
        ruleData.value = result.data?.description ?? "";
        //Get.snackbar("Login Success", "Your login process is success");
      }else if (result.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getRule();
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
}
