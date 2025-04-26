// To parse this JSON data, do
//
//     final loginResponseVo = loginResponseVoFromJson(jsonString);

import 'dart:convert';

LoginResponseVo loginResponseVoFromJson(String str) => LoginResponseVo.fromJson(json.decode(str));

String loginResponseVoToJson(LoginResponseVo data) => json.encode(data.toJson());

class LoginResponseVo {
  int? status;
  String? accessToken;
  String? refreshToken;
  int? expiresIn;

  LoginResponseVo({
    this.status,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
  });

  factory LoginResponseVo.fromJson(Map<String, dynamic> json) => LoginResponseVo(
    status: json["status"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "status":status,
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "expires_in": expiresIn,
  };
}
