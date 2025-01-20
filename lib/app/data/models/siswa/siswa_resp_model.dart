import 'package:json_annotation/json_annotation.dart';

part 'siswa_resp_model.g.dart';

@JsonSerializable()
class SiswaResponse {
  @JsonKey(name: 'username_siswa')
  String? usernameSiswa;

  @JsonKey(name: 'kd_sekolah')
  String? kdSekolah;

  @JsonKey(name: 'nama_siswa')
  String? namaSiswa;

  @JsonKey(name: 'telepon_siswa')
  String? teleponSiswa;

  @JsonKey(name: 'email_siswa')
  String? emailSiswa;

  @JsonKey(name: 'password_siswa')
  String? passwordSiswa;

  @JsonKey(name: 'waktulogin')
  String? waktuLogin;

  @JsonKey(name: 'waktulogout')
  String? waktuLogout;

  @JsonKey(name: 'posting_data_siswa')
  String? postingDataSiswa;

  @JsonKey(name: 'update_data_siswa')
  String? updateDataSiswa;

  @JsonKey(name: 'status_keanggotaan')
  String? statusKeanggotaan;

  @JsonKey(name: 'status_rmv_siswa')
  String? statusRmvSiswa;

  @JsonKey(name: 'type_divace')
  String? typeDivace;

  @JsonKey(name: 'id_kelaspeserta')
  String? idKelaspeserta;

  @JsonKey(name: 'id_kelas')
  String? idKelas;

  @JsonKey(name: 'status_rmv_kelaspeserta')
  String? statusRmvKelaspeserta;

  @JsonKey(name: 'id_sekolah')
  String? idSekolah;

  @JsonKey(name: 'nama_sekolah')
  String? namaSekolah;

  @JsonKey(name: 'jenjang_sekolah')
  String? jenjangSekolah;

  @JsonKey(name: 'jenjang_elearning')
  String? jenjangElearning;

  @JsonKey(name: 'limit_siswa')
  String? limitSiswa;

  @JsonKey(name: 'limit_pengumuman')
  String? limitPengumuman;

  @JsonKey(name: 'limit_tanggal')
  String? limitTanggal;

  @JsonKey(name: 'tgl_input')
  String? tglInput;

  @JsonKey(name: 'layanan')
  String? layanan;

  SiswaResponse({
    this.usernameSiswa,
    this.kdSekolah,
    this.namaSiswa,
    this.teleponSiswa,
    this.emailSiswa,
    this.passwordSiswa,
    this.waktuLogin,
    this.waktuLogout,
    this.postingDataSiswa,
    this.updateDataSiswa,
    this.statusKeanggotaan,
    this.statusRmvSiswa,
    this.typeDivace,
    this.idKelaspeserta,
    this.idKelas,
    this.statusRmvKelaspeserta,
    this.idSekolah,
    this.namaSekolah,
    this.jenjangSekolah,
    this.jenjangElearning,
    this.limitSiswa,
    this.limitPengumuman,
    this.limitTanggal,
    this.tglInput,
    this.layanan,
  });

  factory SiswaResponse.fromJson(Map<String, dynamic> json) =>
      _$SiswaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SiswaResponseToJson(this);
}
