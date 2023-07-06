class Bank_model {
  bool? status;
  String? code;
  String? message;
  Data? data;

  Bank_model({this.status, this.code, this.message, this.data});

  Bank_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Content>? content;
  String? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? number;
  Sort? sort;
  int? size;
  int? numberOfElements;
  bool? first;
  bool? empty;

  Data(
      {this.content,
      this.pageable,
      this.totalPages,
      this.totalElements,
      this.last,
      this.number,
      this.sort,
      this.size,
      this.numberOfElements,
      this.first,
      this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    pageable = json['pageable'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    number = json['number'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    size = json['size'];
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['pageable'] = this.pageable;
    data['totalPages'] = this.totalPages;
    data['totalElements'] = this.totalElements;
    data['last'] = this.last;
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['size'] = this.size;
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['empty'] = this.empty;
    return data;
  }
}

class Content {
  int? id;
  String? bankName;
  String? information;
  String? pathLogoColor;
  String? pathLogoBlack;
  int? tipebank;
  String? prefix;
  String? createdAt;
  bool? status;

  Content(
      {this.id,
      this.bankName,
      this.information,
      this.pathLogoColor,
      this.pathLogoBlack,
      this.tipebank,
      this.prefix,
      this.createdAt,
      this.status});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bankName'];
    information = json['information'];
    pathLogoColor = json['pathLogoColor'];
    pathLogoBlack = json['pathLogoBlack'];
    tipebank = json['tipebank'];
    prefix = json['prefix'];
    createdAt = json['createdAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankName'] = this.bankName;
    data['information'] = this.information;
    data['pathLogoColor'] = this.pathLogoColor;
    data['pathLogoBlack'] = this.pathLogoBlack;
    data['tipebank'] = this.tipebank;
    data['prefix'] = this.prefix;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? unsorted;
  bool? empty;

  Sort({this.sorted, this.unsorted, this.empty});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    unsorted = json['unsorted'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    data['empty'] = this.empty;
    return data;
  }
}
