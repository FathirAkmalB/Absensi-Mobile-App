class Kelas {
  int? id;
  String? name;
  int? isEnabled;
  String? createdUser;
  String? createdDatetime;
  String? updatedUser;
  String? updatedDatetime;
  String? walasName;
  int? countSiswa;
  String? namaJurusan;
  int countHadir = 0;

  Kelas(
      {this.id,
        this.name,
        this.isEnabled,
        this.createdUser,
        this.createdDatetime,
        this.updatedUser,
        this.updatedDatetime,
        this.walasName,
        this.countSiswa,
        this.namaJurusan,
        this.countHadir = 0,
      });

  Kelas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isEnabled = json['is_enabled'];
    createdUser = json['created_user'];
    createdDatetime = json['created_datetime'];
    updatedUser = json['updated_user'];
    updatedDatetime = json['updated_datetime'];
    walasName = json['walas_name'];
    countSiswa = json['count_siswa'];
    namaJurusan = json['nama_jurusan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_enabled'] = this.isEnabled;
    data['created_user'] = this.createdUser;
    data['created_datetime'] = this.createdDatetime;
    data['updated_user'] = this.updatedUser;
    data['updated_datetime'] = this.updatedDatetime;
    data['walas_name'] = this.walasName;
    data['count_siswa'] = this.countSiswa;
    data['nama_jurusan'] = this.namaJurusan;
    data['count_hadir'] = this.countHadir;
    return data;
  }
}