import 'dart:convert';

class ProfileResponseVo {
  int? status;
  String? message;
  ProfileData? data;

  ProfileResponseVo({
    this.status,
    this.message,
    this.data,
  });

  factory ProfileResponseVo.fromJson(Map<String, dynamic> json) {
    return ProfileResponseVo(
      status: json["status"] as int?,
      message: json['message'] as String?,
      data: json['data'] != null ? ProfileData.fromJson(json['data'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status':status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class ProfileData {
  String? id;
  String? balance;
  String? name;
  String? phone;
  DateTime? createdAt;

  ProfileData({
    this.id,
    this.balance,
    this.name,
    this.phone,
    this.createdAt,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'] as String?,
      balance: json['balance'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'balance': balance,
      'name': name,
      'phone': phone,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}