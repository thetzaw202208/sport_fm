class RuleResponseVo {
  int? status;
  Data? data;

  RuleResponseVo({
    this.status,
    this.data,
  });

  // Factory method to create an instance from JSON
  factory RuleResponseVo.fromJson(Map<String, dynamic> json) {
    return RuleResponseVo(
      status: json['status'] as int?,
      data: json['data'] != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null,
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class Data {
  String? id;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to create an instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}