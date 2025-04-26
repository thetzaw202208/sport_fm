// To parse this JSON data, do
//
//     final logoutResponseVo = logoutResponseVoFromJson(jsonString);

import 'dart:convert';

LogoutResponseVo logoutResponseVoFromJson(String str) => LogoutResponseVo.fromJson(json.decode(str));

String logoutResponseVoToJson(LogoutResponseVo data) => json.encode(data.toJson());

class LogoutResponseVo {
  int? status;
  String? message;

  LogoutResponseVo({
    this.status,
    this.message,
  });

  factory LogoutResponseVo.fromJson(Map<String, dynamic> json) => LogoutResponseVo(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status":status,
    "message": message,
  };
}

