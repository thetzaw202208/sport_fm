class GetBankAccResponseVo {
  int? status;
  String? bankAccountId;
  String? bankAccountName;
  String? bankAccountNo;

  GetBankAccResponseVo(
      {this.status,
        this.bankAccountId,
        this.bankAccountName,
        this.bankAccountNo});

  GetBankAccResponseVo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    bankAccountId = json['bank_account_id'];
    bankAccountName = json['bank_account_name'];
    bankAccountNo = json['bank_account_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['bank_account_id'] = bankAccountId;
    data['bank_account_name'] = bankAccountName;
    data['bank_account_no'] = bankAccountNo;
    return data;
  }
}
