import 'package:get/get.dart';
import 'package:sport_fm/response_model/two_d_history_vo.dart';
import 'package:sport_fm/response_model/two_d_numbers_vo.dart';
import 'package:sport_fm/services/local_storage.dart';

import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../views/widgets/custom_text.dart';
import 'get_new_token_controller.dart';

class TwoDHisController extends GetxController{
  TwoDNumbersVo twoDNumbers=TwoDNumbersVo();
  TwoDHistoryVo twoDHistoryVo=TwoDHistoryVo();
  RxBool isLoading=false.obs;
  LocalStorage box=LocalStorage();
  RxList<int> selectedNumber = <int>[].obs;
  RxList<Data> twoDList=<Data>[].obs;
  RxList<DetailData> hList=<DetailData>[].obs;


  @override
  void onInit() {
    //getTwoDData();
    getTwoDHisData();
    //print('get two d data call');
    super.onInit();
  }
  selectNumbers(int index) {
    if (selectedNumber.contains(index)) {
      selectedNumber.remove(index);
    } else {
      selectedNumber.add(index);
    }
  }
  Future<void> getTwoDData() async {
    isLoading.value = true;
    try {

      twoDNumbers = await ApiRepo().getTwoDNumbers();
      if (twoDNumbers.success == 200) {
        twoDList.value=twoDNumbers.data??<Data>[];

        isLoading.value = false;
        //Get.snackbar("Profile Success", "Your login process is success");
      }  else if (twoDNumbers.success == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getTwoDData();
        // Get.defaultDialog(
        //     title: 'please_login_again'.tr,
        //     content: CustomText(text: 'session_expire'.tr),
        //     onConfirm: () {
        //       box.write('isLogin', false);
        //       box.remove('accessKey');
        //       box.remove('refreshKey');
        //       Get.offAll(LoginScreen());
        //     });
      } else if (twoDNumbers.success == 404) {
        Get.defaultDialog(
            title: 'warning'.tr,
            content: CustomText(text: 'close_time'.tr,maxLines: 5),
            onConfirm: (){
              Get.back();

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
  Future<void> getTwoDHisData() async {
    isLoading.value = true;
    try {
      //print('get three d data start');
      twoDHistoryVo = await ApiRepo().getTwoDBetHistory();
      if (twoDHistoryVo.status == 200) {
        hList.value=twoDHistoryVo.resData?.detailData??[];
        //print('get three d data success');
        isLoading.value = false;
       // Get.snackbar("three d Success", "Your login process is success");
      }  else if (twoDHistoryVo.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getTwoDHisData();
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
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}