import 'package:sport_fm/models/bet_request_vo.dart';
import 'package:sport_fm/response_model/betting_confirm_response_vo.dart';
import 'package:sport_fm/response_model/deposit_response_vo.dart';
import 'package:sport_fm/response_model/get_bank_acc_response_vo.dart';
import 'package:sport_fm/response_model/live_result_response_vo.dart';
import 'package:sport_fm/response_model/login_response_vo.dart';
import 'package:sport_fm/response_model/logout_response_vo.dart';
import 'package:sport_fm/response_model/profile_response_vo.dart';
import 'package:sport_fm/response_model/rule_response_vo.dart';
import 'package:sport_fm/response_model/three_d_history_vo.dart';
import 'package:sport_fm/response_model/transaction_response_vo.dart';
import 'package:sport_fm/response_model/two_d_history_vo.dart';
import 'package:sport_fm/response_model/two_d_numbers_vo.dart';
import 'package:sport_fm/services/api_utils.dart';

import '../response_model/refresh_token_response_vo.dart';
import '../utils/custom_exception.dart';
import 'api_constant.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  /// Movie
  // Future<List<SliderModel>> getMovieSlider() async {
  //   try {
  //     final response = await apiUtils
  //         .get(url: "${ApiConstant.display}SliderItem", queryParameters: {
  //       "\$filter":
  //           "displayLocation eq 'movies'  and deletedAt eq null and status eq true",
  //       "\$select":
  //           "name,bannerType,htmlCode,webLink,displayLocation,imageUrl,status,titleId"
  //     });
  //     final movieSliderList = response.data['value'] as List;
  //     return movieSliderList.map((item) => SliderModel.fromJson(item)).toList();
  //   } catch (e) {
  //     throw CustomException(e.toString());
  //   }
  // }

  Future<LoginResponseVo> goLogin(String phoneNumber, String password) async {
    try {
      final response = await apiUtils.post(
          url: "${ApiConstant.baseUrl}${ApiConstant.loginEndPoint}",
          data: {'phone': phoneNumber, 'password': password});
      final loginResponseMap = response.data;
      //print("Here is response data for login");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final loginResponse = LoginResponseVo.fromJson(loginResponseMap);
      return loginResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<DepositResponseVo> doDeposit(String bankId, String amount,
      String userAcc, String userAccName, String transNumber) async {
    try {
      final response = await apiUtils.post(
          url: "${ApiConstant.baseUrl}${ApiConstant.depositEndPoint}",
          data: {
            'bank_account_id': bankId,
            'amount': amount,
            'user_account': userAcc,
            'user_account_name': userAccName,
            'transaction_no': transNumber
          });
      final depositResponseMap = response.data;
      //print("Here is response data for deposit");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final depositResponse = DepositResponseVo.fromJson(depositResponseMap);
      return depositResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<DepositResponseVo> doWithdraw(String amount, String userAcc,
      String userAccName, String bankType) async {
    try {
      final response = await apiUtils.post(
          url: "${ApiConstant.baseUrl}${ApiConstant.withdrawEndPoint}",
          data: {
            'amount': amount,
            'user_account': userAcc,
            'user_account_name': userAccName,
            'bank_type': bankType
          });
      final depositResponseMap = response.data;
      //print("Here is response data for withdraw");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final depositResponse = DepositResponseVo.fromJson(depositResponseMap);
      return depositResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<GetBankAccResponseVo> getBankAcc(String bankType) async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.baseUrl}${ApiConstant.getBankAccEndPoint}",
        queryParameters: {'bank_type': bankType},
      );
      final getBankAccResponseMap = response.data;
      //print("Here is response data for getBankAcc");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final getBankAccResponse =
          GetBankAccResponseVo.fromJson(getBankAccResponseMap);
      return getBankAccResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
  Future<TransactionResponseVo> getTransaction(String paginate) async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.baseUrl}${ApiConstant.transactionEndPoint}",
        queryParameters: {'paginate': paginate},
      );
      final transactionResponseMap = response.data;
      //print("Here is response data for transaction");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final transactionResponse =
      TransactionResponseVo.fromJson(transactionResponseMap);
      return transactionResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
  Future<RuleResponseVo> getPrivacyPolicy() async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.baseUrl}${ApiConstant.ruleEndPoint}",
      );
      final ruleResponseMap = response.data;
      //print("Here is response data for rule");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final ruleResponse = RuleResponseVo.fromJson(ruleResponseMap);
      return ruleResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<LiveResultApiResponse> getLiveData() async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.twoURL}${ApiConstant.liveEndPoint}",
      );
      final liveResponseMap = response.data;
      //print("Here is response data for live");

      // Convert the Map to LoginResponseVo
      final liveResponse = LiveResultApiResponse.fromJson(liveResponseMap);
      return liveResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<ProfileResponseVo> getProfileData() async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.baseUrl}${ApiConstant.profileEndPoint}",
      );
      final profileResponseMap = response.data;
      //print("Here is response data for profile");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final profileResponse = ProfileResponseVo.fromJson(profileResponseMap);
      return profileResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
  Future<TwoDNumbersVo> getTwoDNumbers() async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.baseUrl}${ApiConstant.twoDNumberEndPoint}",
      );
      final twoDResponseMap = response.data;
      //print("Here is response data for profile");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final twoResponse = TwoDNumbersVo.fromJson(twoDResponseMap);
      return twoResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
  Future<TwoDNumbersVo> getThreeDNumbers() async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.baseUrl}${ApiConstant.threeDNumberEndPoint}",
      );
      final twoDResponseMap = response.data;
      //print("Here is response data for profile");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final twoResponse = TwoDNumbersVo.fromJson(twoDResponseMap);
      return twoResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
  ///Logout
  Future<LogoutResponseVo> goLogout() async {
    try {
      final response = await apiUtils.post(
        url: "${ApiConstant.baseUrl}${ApiConstant.logoutEndPoint}",
      );
      final logoutResponseMap = response.data;
      //print("Here is response data for logout");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final logoutResponse = LogoutResponseVo.fromJson(logoutResponseMap);
      return logoutResponse;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
  //refresh token
  Future<TokenRefreshResponseVo> getRefreshToken() async {
    try {
      final response = await apiUtils.postRefresh(
          url: "${ApiConstant.baseUrl}${ApiConstant.tokenRefreshEndPoint}",
          );
      final tkResponseMap = response.data;

      // Convert the Map to LoginResponseVo
      final tkResp = TokenRefreshResponseVo.fromJson(tkResponseMap);
      return tkResp;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
 //BettingConfirm
  Future<BetConfirmVo> twoDBettingConfirm(List<BetRequestVo> betList) async {
    try {
      final response = await apiUtils.post(
          url: "${ApiConstant.baseUrl}${ApiConstant.twoDBetEndPoint}",
          data: {'bets':betList});
      final betResponseMap = response.data;
      //print("Here is response data for betConfirm");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final betConfirmResp = BetConfirmVo.fromJson(betResponseMap);
      return betConfirmResp;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
  Future<BetConfirmVo> threeDBettingConfirm(List<BetRequestVo> betList) async {
    try {
      final response = await apiUtils.post(
          url: "${ApiConstant.baseUrl}${ApiConstant.threeDBetEndPoint}",
          data: {'bets':betList});
      final betResponseMap = response.data;
      //print("Here is response data for betConfirm");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final betConfirmResp = BetConfirmVo.fromJson(betResponseMap);
      return betConfirmResp;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<TwoDHistoryVo> getTwoDBetHistory() async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseUrl}${ApiConstant.twoDBetHistEndPoint}",
          );
      final twoHistoryMap = response.data;
      //print("Here is response data for two bet His");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final twoDHisResp = TwoDHistoryVo.fromJson(twoHistoryMap);
      return twoDHisResp;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
  Future<ThreeDHistoryVo> getThreeDBetHistory() async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.baseUrl}${ApiConstant.threeDBetHistEndPoint}",
      );
      final threeHistoryMap = response.data;
      //print("Here is response data for two bet His");
      //print(response.data['status']);

      // Convert the Map to LoginResponseVo
      final threeDHisResp = ThreeDHistoryVo.fromJson(threeHistoryMap);
      return threeDHisResp;
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
