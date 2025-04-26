// To parse this JSON data, do
//
//     final tokenRefreshResponseVo = tokenRefreshResponseVoFromJson(jsonString);

import 'dart:convert';

TokenRefreshResponseVo tokenRefreshResponseVoFromJson(String str) => TokenRefreshResponseVo.fromJson(json.decode(str));

String tokenRefreshResponseVoToJson(TokenRefreshResponseVo data) => json.encode(data.toJson());

class TokenRefreshResponseVo {
  int? status;
  String? accessToken;
  int? expiresIn;

  TokenRefreshResponseVo({
    this.status,
    this.accessToken,
    this.expiresIn,
  });

  factory TokenRefreshResponseVo.fromJson(Map<String, dynamic> json) => TokenRefreshResponseVo(
    status: json["status"],
    accessToken: json["access_token"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "status":status,
    "access_token": accessToken,
    "expires_in": expiresIn,
  };
}
