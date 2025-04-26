class TwoDHistoryVo {
  int? status;
  ResData? resData;

  TwoDHistoryVo({this.status, this.resData});

  TwoDHistoryVo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resData = json['data'] != null ?  ResData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (resData != null) {
      data['data'] = resData!.toJson();
    }
    return data;
  }
}

class ResData {
  int? currentPage;
  List<DetailData>? detailData;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  ResData(
      {this.currentPage,
        this.detailData,
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

  ResData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      detailData = <DetailData>[];
      json['data'].forEach((v) {
        detailData!.add( DetailData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
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
    if (detailData != null) {
      data['data'] = detailData!.map((v) => v.toJson()).toList();
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

class DetailData {
  String? id;
  String? userId;
  String? twoLedgerId;
  String? betNumber;
  int? betAmount;
  String? createdAt;
  String? updatedAt;

  DetailData(
      {this.id,
        this.userId,
        this.twoLedgerId,
        this.betNumber,
        this.betAmount,
        this.createdAt,
        this.updatedAt});

  DetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    twoLedgerId = json['two_ledger_id'];
    betNumber = json['bet_number'];
    betAmount = json['bet_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['two_ledger_id'] = twoLedgerId;
    data['bet_number'] = betNumber;
    data['bet_amount'] = betAmount;
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
