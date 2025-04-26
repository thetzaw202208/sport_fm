class TransactionResponseVo {
  int? status;
  Data? data;

  TransactionResponseVo({this.status, this.data});

  TransactionResponseVo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<TransactionDetailData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <TransactionDetailData>[];
      json['data'].forEach((v) {
        data!.add(TransactionDetailData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class TransactionDetailData {
  String? id;
  String? userId;
  String? bankAccountId;
  String? amount;
  String? userAccount;
  String? userAccountName;
  String? requestedDate;
  String? approvedDate;
  String? type;
  String? bankType;
  String? createdAt;
  String? updatedAt;

  TransactionDetailData(
      {this.id,
        this.userId,
        this.bankAccountId,
        this.amount,
        this.userAccount,
        this.userAccountName,
        this.requestedDate,
        this.approvedDate,
        this.type,
        this.bankType,
        this.createdAt,
        this.updatedAt});

  TransactionDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bankAccountId = json['bank_account_id'];
    amount = json['amount'];
    userAccount = json['user_account'];
    userAccountName = json['user_account_name'];
    requestedDate = json['requested_date'];
    approvedDate = json['approved_date'];
    type = json['type'];
    bankType = json['bank_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['bank_account_id'] = bankAccountId;
    data['amount'] = amount;
    data['user_account'] = userAccount;
    data['user_account_name'] = userAccountName;
    data['requested_date'] = requestedDate;
    data['approved_date'] = approvedDate;
    data['type'] = type;
    data['bank_type'] = bankType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
