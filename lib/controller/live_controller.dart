import 'dart:async';
import 'package:get/get.dart';
import 'package:sport_fm/response_model/live_result_response_vo.dart';
import '../services/api_repo.dart';

class LiveController extends GetxController {
  LiveResultApiResponse liveResultData = LiveResultApiResponse();
  RxBool isLoading = false.obs;
  RxString ruleData = ''.obs;
  Live? liveData;
  List<Result>? resultData;
  Holiday? holidayData;
  Timer? _timer;
  RxString updateTime='---'.obs;
  RxBool isHoliday=false.obs;
  @override
  void onInit() {

    if (!shouldCallApi()) {
      //print('API call skipped due to weekend or holiday.');
      return; // Skip the API call
    }else{
      _timer=Timer.periodic(const Duration(seconds: 1), (timer) {
        //getLiveResult();
      });
    }


    super.onInit();
  }

  bool shouldCallApi() {
    DateTime today = DateTime.now();

    // Check if today is Saturday (6) or Sunday (0)
    if (today.weekday == DateTime.saturday || today.weekday == DateTime.sunday) {
      return false; // Don't call the API on weekends
    }

    // Check if today is a holiday
    // for (var holiday in myanmarHolidays) {
    //   if (today.year == holiday.year && today.month == holiday.month && today.day == holiday.day) {
    //     return false; // Don't call the API on holidays
    //   }
    // }

    return true; // Call the API if it's not a weekend or holiday
  }

  Future<void> getLiveResult() async {
    try {
      liveResultData = await ApiRepo().getLiveData();
     liveData=liveResultData.live;
     resultData=liveResultData.result;
     holidayData=liveResultData.holiday;

      //print('work here zzzzzzzzzzzz ${holidayData?.status}');
     // if(resultData?.isNotEmpty==true&&liveData?.value!=null){

        ///One
        if(resultData?[0].twod=="--"){
          //print('work here zzzzzzzzzzzz ${ updateTime.value}');
          updateTime.value=liveData?.time.toString()??"--";
        }else{
          updateTime.value=resultData?[0].openTime.toString()??"--";
        }
        ///Two
        if(resultData?[1].twod=="--"){
          updateTime.value=liveData?.time.toString()??"--";
        }else{
          updateTime.value=resultData?[1].openTime.toString()??"--";
        }
        ///Three
        if(resultData?[2].twod=="--"){
          updateTime.value=liveData?.time.toString()??"--";
        }else{
          updateTime.value=resultData?[2].openTime.toString()??"--";
        }
        ///Four
        if(resultData?[3].twod=="--"){
          updateTime.value=liveData?.time.toString()??"--";
        }else{
          updateTime.value=resultData?[3].openTime.toString()??"--";
        }
      //}
    } catch (e) {
      // constants.showSnackBar(
      //     title: 'Error', msg: e.toString(), textColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
}
