import 'package:get/get.dart';
import 'package:sport_fm/response_model/three_d_history_vo.dart';
import 'package:sport_fm/response_model/two_d_numbers_vo.dart';
import 'package:sport_fm/services/local_storage.dart';

import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import 'get_new_token_controller.dart';

class ThreeDHisController extends GetxController{
  ThreeDHistoryVo twoDHistoryVo=ThreeDHistoryVo();
  RxBool isLoading=false.obs;
  LocalStorage box=LocalStorage();
  RxList<int> selectedNumber = <int>[].obs;
  RxList<Data> twoDList=<Data>[].obs;
  RxList<DetailData> hList=<DetailData>[].obs;


  @override
  void onInit() {
    //getTwoDData();
    getThreeDHisData();
    ////print('get two d data call');
    super.onInit();
  }


  Future<void> getThreeDHisData() async {
    isLoading.value = true;
    try {
      ////print('get three d data start');
      twoDHistoryVo = await ApiRepo().getThreeDBetHistory();
      if (twoDHistoryVo.status == 200) {
        hList.value=twoDHistoryVo.resData?.detailData??[];
        //print('get three d data success');
        isLoading.value = false;
        //Get.snackbar("three d Success", "Your login process is success");
      }  else if (twoDHistoryVo.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getThreeDHisData();
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
      constants.showSnackBar(
          title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}