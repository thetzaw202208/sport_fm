class TwoDNumbersVo {
  int? success;
  List<Data>? data;

  TwoDNumbersVo({this.success, this.data});

  TwoDNumbersVo.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? betNumber;
  int? limitedAmount;
  int? leftAmount;
  bool? isFull;

  Data({this.betNumber, this.limitedAmount, this.leftAmount, this.isFull});

  Data.fromJson(Map<String, dynamic> json) {
    betNumber = json['bet_number'];
    limitedAmount = json['limited_amount'];
    leftAmount = json['left_amount'];
    isFull = json['is_full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bet_number'] = betNumber;
    data['limited_amount'] = limitedAmount;
    data['left_amount'] = leftAmount;
    data['is_full'] = isFull;
    return data;
  }
}
