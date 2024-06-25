class IdentitySiswa {
  String? nik;
  String? nis;
  int? idKelas;
  String? rfid;
  String? email;
  String? namaSiswa;
  String? jk;
  String? tempatLahir;
  String? tglLahir;
  String? address;
  String? telegramId;
  int? activationCode;
  int? expActivationCode;
  int? isEnabled;
  String? createdUser;
  String? createdDatetime;
  String? updatedUser;
  String? updatedDatetime;
  int? idJurusan;

  IdentitySiswa(
      {this.nik,
        this.nis,
        this.idKelas,
        this.rfid,
        this.email,
        this.namaSiswa,
        this.jk,
        this.tempatLahir,
        this.tglLahir,
        this.address,
        this.telegramId,
        this.activationCode,
        this.expActivationCode,
        this.isEnabled,
        this.createdUser,
        this.createdDatetime,
        this.updatedUser,
        this.updatedDatetime,
        this.idJurusan});

  IdentitySiswa.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nis = json['nis'];
    idKelas = json['id_kelas'];
    rfid = json['rfid'];
    email = json['email'];
    namaSiswa = json['nama_siswa'];
    jk = json['jk'];
    tempatLahir = json['tempat_lahir'];
    tglLahir = json['tgl_lahir'];
    address = json['address'];
    telegramId = json['telegram_id'];
    activationCode = json['activation_code'];
    expActivationCode = json['exp_activation_code'];
    isEnabled = json['is_enabled'];
    createdUser = json['created_user'];
    createdDatetime = json['created_datetime'];
    updatedUser = json['updated_user'];
    updatedDatetime = json['updated_datetime'];
    idJurusan = json['id_jurusan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['nis'] = this.nis;
    data['id_kelas'] = this.idKelas;
    data['rfid'] = this.rfid;
    data['email'] = this.email;
    data['nama_siswa'] = this.namaSiswa;
    data['jk'] = this.jk;
    data['tempat_lahir'] = this.tempatLahir;
    data['tgl_lahir'] = this.tglLahir;
    data['address'] = this.address;
    data['telegram_id'] = this.telegramId;
    data['activation_code'] = this.activationCode;
    data['exp_activation_code'] = this.expActivationCode;
    data['is_enabled'] = this.isEnabled;
    data['created_user'] = this.createdUser;
    data['created_datetime'] = this.createdDatetime;
    data['updated_user'] = this.updatedUser;
    data['updated_datetime'] = this.updatedDatetime;
    data['id_jurusan'] = this.idJurusan;
    return data;
  }
}
