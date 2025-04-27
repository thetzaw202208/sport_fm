import 'package:get/get.dart';
import 'package:sport_fm/response_model/transaction_response_vo.dart';
import 'package:sport_fm/services/local_storage.dart';

import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import 'get_new_token_controller.dart';

class TransactionHistoryController extends GetxController{
  TransactionResponseVo historyResult = TransactionResponseVo();
  RxList<TransactionDetailData> detailData = <TransactionDetailData>[].obs;
  LocalStorage box = LocalStorage();


  @override
  void onInit() {
    getTransactionHistory("30");
    super.onInit();
  }
  Future<void> getTransactionHistory(String page) async {


    try {
      historyResult = await ApiRepo()
          .getTransaction(page);
      if (historyResult.status == 200) {
        detailData.value=historyResult.data?.data??[];
        // Get.snackbar("Deposit Success", historyResult.message ?? "");
        // Get.offAll(SuccessScreen());
      }  else if (historyResult.status == 401) {
        var getNewT= Get.put(GetNewTokenController());
        getNewT.getNewToken();
        getTransactionHistory('30');
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

    }
  }
}