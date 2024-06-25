import 'package:absensi_mobile/entities/enum/status_absen.dart';

class SiswaAtn {
  String? nik;
  String? name;
  StatusAbsen statusAbsen = StatusAbsen.Alpha;
  DateTime? dateAbsen;
  String? timeIn;
  String? timeOut;

  SiswaAtn({
    this.nik,
    this.name,
    this.statusAbsen = StatusAbsen.Alpha,
    this.dateAbsen,
    this.timeIn,
    this.timeOut,
  });

  SiswaAtn.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    name = json['nama_siswa'];
  }

}