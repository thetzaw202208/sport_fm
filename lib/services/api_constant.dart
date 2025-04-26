import 'package:sport_fm/services/local_storage.dart';

class ApiConstant {
  ///Base URL
  static String baseUrl="http://163.44.197.54/api/v1/";
  static String twoURL = "https://api.thaistock2d.com/";
  ///Endpoint
  static String loginEndPoint="login";
  static String profileEndPoint="profile";
  static String logoutEndPoint="logout";
  static String tokenRefreshEndPoint="token/refresh";
  static String liveEndPoint="live";
  static String ruleEndPoint="rule";
  static String getBankAccEndPoint="bank-account";
  static String depositEndPoint="deposit";
  static String withdrawEndPoint="withdraw";
  static String transactionEndPoint="transactions";
  static String twoDNumberEndPoint="2d-numbers";
  static String threeDNumberEndPoint="3d-numbers";
  static String twoDBetEndPoint="2d-bet";
  static String threeDBetEndPoint="3d-bet";
  static String twoDBetHistEndPoint="2d-bet-histories";
  static String threeDBetHistEndPoint="3d-bet-histories";
 // static String transactionEndPoint="transactions";

  ///Content Type
  static String contentType = 'application/json';
  String authorizationToken=LocalStorage.instance.read('accessKey')??"";
  String refreshAuthToken="";
  // static String baseUrl = 'https://api.maharstg.com'; //demo
  // static String display = '/display/v1/';
  // static String content = '/content/v1/';
  // static String profile = '/profile/v1/';
  // static String playerUrl = 'https://player.maharstg.com/player/v1?';
}
