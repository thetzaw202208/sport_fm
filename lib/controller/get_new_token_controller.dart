import 'package:get/get.dart';
import 'package:sport_fm/response_model/refresh_token_response_vo.dart';
import 'package:sport_fm/services/local_storage.dart';

import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../views/screens/login/login_screen.dart';
import '../views/widgets/custom_text.dart';

class GetNewTokenController extends GetxController{
  LocalStorage box = LocalStorage();
  TokenRefreshResponseVo result = TokenRefreshResponseVo();
  RxBool isLoading = false.obs;

  Future<void> getNewToken() async {
    //print('Request new token work');
    try {
      result = await ApiRepo().getRefreshToken();
      if (result.status == 200) {
        box.write('accessKey', result.accessToken);
      }else if (result.status == 401) {

        Get.defaultDialog(
          barrierDismissible: false,
            title: 'please_login_again'.tr,
            content: CustomText(text: 'session_expire'.tr,maxLines: 5,),
            onConfirm: (){
              box.write('isLogin', false);
              box.remove('accessKey');
              box.remove('refreshKey');
              Get.offAll(LoginScreen());
            }
        );

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
}