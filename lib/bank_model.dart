class Bank_model {
  int? statusCode;
  Payload? payload;

  Bank_model({this.statusCode, this.payload});

  Bank_model.fromJson(Map<String, dynamic> json) {
    if (json['status_code'] is String) {
      statusCode = int.tryParse(json['status_code']);
    } else {
      statusCode = json['status_code'];
    }
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Payload {
  bool? success;
  Data? data;

  Payload({this.success, this.data});

  Payload.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Types>? types;
  List<Bank>? bank;

  Data({this.types, this.bank});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    if (json['bank'] != null) {
      bank = <Bank>[];
      json['bank'].forEach((v) {
        bank!.add(new Bank.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (bank != null) {
      data['bank'] = bank!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Types {
  int? id;
  String? deskripsi;
  String? select;
  String? numbers;
  String? label;

  Types({this.id, this.deskripsi, this.select, this.numbers, this.label});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deskripsi = json['deskripsi'];
    select = json['select'];
    numbers = json['numbers'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deskripsi'] = this.deskripsi;
    data['select'] = this.select;
    data['numbers'] = this.numbers;
    data['label'] = this.label;
    return data;
  }
}

class Bank {
  int? id;
  String? namaBank;

  Bank({this.id, this.namaBank});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBank = json['nama_bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_bank'] = this.namaBank;
    return data;
  }
}
