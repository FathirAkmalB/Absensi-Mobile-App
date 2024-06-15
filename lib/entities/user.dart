import 'package:absensi_mobile/entities/identity_guru.dart';
import 'package:absensi_mobile/entities/identity_siswa.dart';

class User {
  int? id;
  String? userId;
  String? type;
  String? username;
  int? levelAkses;
  int? isEnabled;
  String? createdUser;
  String? token;
  IdentitySiswa? identitySiswa;
  IdentityGuru? identityGuru;

  User(
      {this.id,
        this.userId,
        this.type,
        this.username,
        this.levelAkses,
        this.isEnabled,
        this.createdUser,
        this.token,
        this.identitySiswa,
        this.identityGuru,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    username = json['username'];
    levelAkses = json['level_akses'];
    isEnabled = json['is_enabled'];
    createdUser = json['created_user'];
    token = json['token'];

    if(json['type'] == "siswa"){
      identitySiswa = json['identity'] != null
          ? new IdentitySiswa.fromJson(json['identity'])
          : null;
    }

    if(json['type'] == "guru"){
      identityGuru = json['identity'] != null
          ? new IdentityGuru.fromJson(json['identity'])
          : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['username'] = this.username;
    data['level_akses'] = this.levelAkses;
    data['is_enabled'] = this.isEnabled;
    data['created_user'] = this.createdUser;
    data['token'] = this.token;
    if (this.identitySiswa != null) {
      data['identity'] = this.identitySiswa!.toJson();
    }
    if (this.identityGuru != null) {
      data['identity'] = this.identityGuru!.toJson();
    }
    return data;
  }
}