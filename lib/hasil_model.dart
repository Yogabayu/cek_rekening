class Hasil_model {
  bool? status;
  String? code;
  String? message;
  Data? data;

  Hasil_model({this.status, this.code, this.message, this.data});

  Hasil_model.fromJson(Map<String, dynamic> json) {
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
  Null whitelist;
  bool? statusWhitelist;
  Laporan? laporan;
  List<LaporanDetail>? laporanDetail;

  Data(
      {this.whitelist, this.statusWhitelist, this.laporan, this.laporanDetail});

  Data.fromJson(Map<String, dynamic> json) {
    whitelist = json['whitelist'];
    statusWhitelist = json['statusWhitelist'];
    laporan =
        json['laporan'] != null ? new Laporan.fromJson(json['laporan']) : null;
    if (json['laporanDetail'] != null) {
      laporanDetail = <LaporanDetail>[];
      json['laporanDetail'].forEach((v) {
        laporanDetail!.add(new LaporanDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whitelist'] = this.whitelist;
    data['statusWhitelist'] = this.statusWhitelist;
    if (this.laporan != null) {
      data['laporan'] = this.laporan!.toJson();
    }
    if (this.laporanDetail != null) {
      data['laporanDetail'] =
          this.laporanDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Laporan {
  int? id;
  Bank? bank;
  String? accountNo;
  String? accountName;
  KategoriAduan? kategoriAduan;
  Status? status;
  int? createdDate;

  Laporan(
      {this.id,
      this.bank,
      this.accountNo,
      this.accountName,
      this.kategoriAduan,
      this.status,
      this.createdDate});

  Laporan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    accountNo = json['accountNo'];
    accountName = json['accountName'];
    kategoriAduan = json['kategoriAduan'] != null
        ? new KategoriAduan.fromJson(json['kategoriAduan'])
        : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    data['accountNo'] = this.accountNo;
    data['accountName'] = this.accountName;
    if (this.kategoriAduan != null) {
      data['kategoriAduan'] = this.kategoriAduan!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['createdDate'] = this.createdDate;
    return data;
  }
}

class Bank {
  int? id;
  String? bankName;
  Null information;
  String? pathLogoColor;
  String? pathLogoBlack;
  int? tipebank;
  bool? status;
  bool? deleted;
  Null prefix;
  int? createdAt;

  Bank(
      {this.id,
      this.bankName,
      this.information,
      this.pathLogoColor,
      this.pathLogoBlack,
      this.tipebank,
      this.status,
      this.deleted,
      this.prefix,
      this.createdAt});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bankName'];
    information = json['information'];
    pathLogoColor = json['pathLogoColor'];
    pathLogoBlack = json['pathLogoBlack'];
    tipebank = json['tipebank'];
    status = json['status'];
    deleted = json['deleted'];
    prefix = json['prefix'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankName'] = this.bankName;
    data['information'] = this.information;
    data['pathLogoColor'] = this.pathLogoColor;
    data['pathLogoBlack'] = this.pathLogoBlack;
    data['tipebank'] = this.tipebank;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    data['prefix'] = this.prefix;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class KategoriAduan {
  int? id;
  String? deskripsi;
  int? parentId;
  String? keterangan;
  String? pathLogo;
  String? aduannomorId;
  bool? visible;

  KategoriAduan(
      {this.id,
      this.deskripsi,
      this.parentId,
      this.keterangan,
      this.pathLogo,
      this.aduannomorId,
      this.visible});

  KategoriAduan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deskripsi = json['deskripsi'];
    parentId = json['parentId'];
    keterangan = json['keterangan'];
    pathLogo = json['pathLogo'];
    aduannomorId = json['aduannomorId'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deskripsi'] = this.deskripsi;
    data['parentId'] = this.parentId;
    data['keterangan'] = this.keterangan;
    data['pathLogo'] = this.pathLogo;
    data['aduannomorId'] = this.aduannomorId;
    data['visible'] = this.visible;
    return data;
  }
}

class Status {
  int? id;
  String? description;

  Status({this.id, this.description});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}

class LaporanDetail {
  int? id;
  Laporan? laporanId;
  Status? tipeAduan;
  String? chronology;
  int? totalLoss;
  SumberMedia? sumberMedia;
  int? laporanDate;
  Null incidentDate;
  String? reporterEmail;
  String? reporterFullname;
  String? reporterPhoneNumber;
  int? reporterAge;
  int? reporterGender;
  String? reporterIdNumber;
  String? publicId;
  String? reporterAddress;
  String? suspectName;
  Null suspectPhoneNumber;
  Null grabTime;
  KategoriAduan? kategoriAduan;
  Null verificationDate;
  Status? status;
  int? verificatorId;
  Verificator? verificator;
  List<Files>? files;
  Kota? kota;
  String? detailSumberMedia;
  String? remarks;
  bool? disputed;
  Null alasanCancel;

  LaporanDetail(
      {this.id,
      this.laporanId,
      this.tipeAduan,
      this.chronology,
      this.totalLoss,
      this.sumberMedia,
      this.laporanDate,
      this.incidentDate,
      this.reporterEmail,
      this.reporterFullname,
      this.reporterPhoneNumber,
      this.reporterAge,
      this.reporterGender,
      this.reporterIdNumber,
      this.publicId,
      this.reporterAddress,
      this.suspectName,
      this.suspectPhoneNumber,
      this.grabTime,
      this.kategoriAduan,
      this.verificationDate,
      this.status,
      this.verificatorId,
      this.verificator,
      this.files,
      this.kota,
      this.detailSumberMedia,
      this.remarks,
      this.disputed,
      this.alasanCancel});

  LaporanDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    laporanId = json['laporanId'] != null
        ? new Laporan.fromJson(json['laporanId'])
        : null;
    tipeAduan = json['tipeAduan'] != null
        ? new Status.fromJson(json['tipeAduan'])
        : null;
    chronology = json['chronology'];
    totalLoss = json['totalLoss'];
    sumberMedia = json['sumberMedia'] != null
        ? new SumberMedia.fromJson(json['sumberMedia'])
        : null;
    laporanDate = json['laporanDate'];
    incidentDate = json['incidentDate'];
    reporterEmail = json['reporterEmail'];
    reporterFullname = json['reporterFullname'];
    reporterPhoneNumber = json['reporterPhoneNumber'];
    reporterAge = json['reporterAge'];
    reporterGender = json['reporterGender'];
    reporterIdNumber = json['reporterIdNumber'];
    publicId = json['publicId'];
    reporterAddress = json['reporterAddress'];
    suspectName = json['suspectName'];
    suspectPhoneNumber = json['suspectPhoneNumber'];
    grabTime = json['grabTime'];
    kategoriAduan = json['kategoriAduan'] != null
        ? new KategoriAduan.fromJson(json['kategoriAduan'])
        : null;
    verificationDate = json['verificationDate'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    verificatorId = json['verificatorId'];
    verificator = json['verificator'] != null
        ? new Verificator.fromJson(json['verificator'])
        : null;
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
    kota = json['kota'] != null ? new Kota.fromJson(json['kota']) : null;
    detailSumberMedia = json['detailSumberMedia'];
    remarks = json['remarks'];
    disputed = json['disputed'];
    alasanCancel = json['alasanCancel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.laporanId != null) {
      data['laporanId'] = this.laporanId!.toJson();
    }
    if (this.tipeAduan != null) {
      data['tipeAduan'] = this.tipeAduan!.toJson();
    }
    data['chronology'] = this.chronology;
    data['totalLoss'] = this.totalLoss;
    if (this.sumberMedia != null) {
      data['sumberMedia'] = this.sumberMedia!.toJson();
    }
    data['laporanDate'] = this.laporanDate;
    data['incidentDate'] = this.incidentDate;
    data['reporterEmail'] = this.reporterEmail;
    data['reporterFullname'] = this.reporterFullname;
    data['reporterPhoneNumber'] = this.reporterPhoneNumber;
    data['reporterAge'] = this.reporterAge;
    data['reporterGender'] = this.reporterGender;
    data['reporterIdNumber'] = this.reporterIdNumber;
    data['publicId'] = this.publicId;
    data['reporterAddress'] = this.reporterAddress;
    data['suspectName'] = this.suspectName;
    data['suspectPhoneNumber'] = this.suspectPhoneNumber;
    data['grabTime'] = this.grabTime;
    if (this.kategoriAduan != null) {
      data['kategoriAduan'] = this.kategoriAduan!.toJson();
    }
    data['verificationDate'] = this.verificationDate;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['verificatorId'] = this.verificatorId;
    if (this.verificator != null) {
      data['verificator'] = this.verificator!.toJson();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    if (this.kota != null) {
      data['kota'] = this.kota!.toJson();
    }
    data['detailSumberMedia'] = this.detailSumberMedia;
    data['remarks'] = this.remarks;
    data['disputed'] = this.disputed;
    data['alasanCancel'] = this.alasanCancel;
    return data;
  }
}

class SumberMedia {
  int? id;
  String? description;
  String? information;
  bool? active;

  SumberMedia({this.id, this.description, this.information, this.active});

  SumberMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    information = json['information'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['information'] = this.information;
    data['active'] = this.active;
    return data;
  }
}

class StatusAduan {
  int? id;
  String? description;
  StatusAduan? tipeAduan;

  StatusAduan({this.id, this.description, this.tipeAduan});

  StatusAduan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    tipeAduan = json['tipeAduan'] != null
        ? new StatusAduan.fromJson(json['tipeAduan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    if (this.tipeAduan != null) {
      data['tipeAduan'] = this.tipeAduan!.toJson();
    }
    return data;
  }
}

class Verificator {
  int? id;
  String? email;
  String? telpNo;
  String? fullname;
  String? password;
  Role? role;
  Null userAccess;
  Bank? bank;
  String? ktpNo;
  String? address;
  String? pathPhoto;
  String? information;
  String? username;
  bool? active;
  List<Menus>? menus;

  Verificator(
      {this.id,
      this.email,
      this.telpNo,
      this.fullname,
      this.password,
      this.role,
      this.userAccess,
      this.bank,
      this.ktpNo,
      this.address,
      this.pathPhoto,
      this.information,
      this.username,
      this.active,
      this.menus});

  Verificator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    telpNo = json['telpNo'];
    fullname = json['fullname'];
    password = json['password'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    userAccess = json['userAccess'];
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    ktpNo = json['ktpNo'];
    address = json['address'];
    pathPhoto = json['pathPhoto'];
    information = json['information'];
    username = json['username'];
    active = json['active'];
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['telpNo'] = this.telpNo;
    data['fullname'] = this.fullname;
    data['password'] = this.password;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['userAccess'] = this.userAccess;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    data['ktpNo'] = this.ktpNo;
    data['address'] = this.address;
    data['pathPhoto'] = this.pathPhoto;
    data['information'] = this.information;
    data['username'] = this.username;
    data['active'] = this.active;
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Role {
  int? id;
  String? roleName;
  List<Menus>? menus;

  Role({this.id, this.roleName, this.menus});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['roleName'];
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roleName'] = this.roleName;
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menus {
  String? id;
  String? name;
  String? route;
  String? title;
  String? icon;
  bool? status;
  int? orderNumber;
  bool? bParent;

  Menus(
      {this.id,
      this.name,
      this.route,
      this.title,
      this.icon,
      this.status,
      this.orderNumber,
      this.bParent});

  Menus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    route = json['route'];
    title = json['title'];
    icon = json['icon'];
    status = json['status'];
    orderNumber = json['order_number'];
    bParent = json['_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['route'] = this.route;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['status'] = this.status;
    data['order_number'] = this.orderNumber;
    data['_parent'] = this.bParent;
    return data;
  }
}

class Files {
  int? id;
  int? idDetailLaporan;
  File? file;
  int? fileId;
  int? idmedia;
  Status? media;
  int? uploaddate;
  bool? deleted;

  Files(
      {this.id,
      this.idDetailLaporan,
      this.file,
      this.fileId,
      this.idmedia,
      this.media,
      this.uploaddate,
      this.deleted});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idDetailLaporan = json['idDetailLaporan'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    fileId = json['fileId'];
    idmedia = json['idmedia'];
    media = json['media'] != null ? new Status.fromJson(json['media']) : null;
    uploaddate = json['uploaddate'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idDetailLaporan'] = this.idDetailLaporan;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['fileId'] = this.fileId;
    data['idmedia'] = this.idmedia;
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    data['uploaddate'] = this.uploaddate;
    data['deleted'] = this.deleted;
    return data;
  }
}

class File {
  int? id;
  String? name;
  String? contentType;
  String? path;

  File({this.id, this.name, this.contentType, this.path});

  File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contentType = json['contentType'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contentType'] = this.contentType;
    data['path'] = this.path;
    return data;
  }
}

class Kota {
  int? id;
  String? name;
  String? aduannomorId;

  Kota({this.id, this.name, this.aduannomorId});

  Kota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    aduannomorId = json['aduannomorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['aduannomorId'] = this.aduannomorId;
    return data;
  }
}
