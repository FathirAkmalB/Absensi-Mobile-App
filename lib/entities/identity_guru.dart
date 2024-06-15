import 'package:absensi_mobile/entities/kelas.dart';

class IdentityGuru {
  String? nip;
  String? name;
  String? jk;
  String? tempatLahir;
  String? tglLahir;
  String? address;
  int? isEnabled;
  String? createdUser;
  String? createdDatetime;
  String? updatedUser;
  String? updatedDatetime;
  List<Kelas>? kelas;

  IdentityGuru(
      {this.nip,
        this.name,
        this.jk,
        this.tempatLahir,
        this.tglLahir,
        this.address,
        this.isEnabled,
        this.createdUser,
        this.createdDatetime,
        this.updatedUser,
        this.updatedDatetime,
        this.kelas});

  IdentityGuru.fromJson(Map<String, dynamic> json) {
    nip = json['nip'];
    name = json['name'];
    jk = json['jk'];
    tempatLahir = json['tempat_lahir'];
    tglLahir = json['tgl_lahir'];
    address = json['address'];
    isEnabled = json['is_enabled'];
    createdUser = json['created_user'];
    createdDatetime = json['created_datetime'];
    updatedUser = json['updated_user'];
    updatedDatetime = json['updated_datetime'];
    if (json['id_kelas'] != null) {
      kelas = <Kelas>[];
      json['id_kelas'].forEach((v) {
        kelas!.add(new Kelas.fromJson(v));
      });
    }

    if (json['kelas'] != null) {
      kelas = <Kelas>[];
      json['kelas'].forEach((v) {
        kelas!.add(new Kelas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nip'] = this.nip;
    data['name'] = this.name;
    data['jk'] = this.jk;
    data['tempat_lahir'] = this.tempatLahir;
    data['tgl_lahir'] = this.tglLahir;
    data['address'] = this.address;
    data['is_enabled'] = this.isEnabled;
    data['created_user'] = this.createdUser;
    data['created_datetime'] = this.createdDatetime;
    data['updated_user'] = this.updatedUser;
    data['updated_datetime'] = this.updatedDatetime;
    if (this.kelas != null) {
      data['kelas'] = this.kelas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
