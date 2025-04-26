class BetRequestVo {
  int? number;
  int? amount;

  BetRequestVo({this.number, this.amount});

  BetRequestVo.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['amount'] = amount;
    return data;
  }
}
