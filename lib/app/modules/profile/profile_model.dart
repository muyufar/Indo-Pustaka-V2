import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'username_siswa')
  String? usernameSiswa;
  @JsonKey(name: 'nama_siswa')
  String? namaSiswa;
  @JsonKey(name: 'kd_sekolah')
  String? kdSekolah;
  @JsonKey(name: 'nama_sekolah')
  String? namaSekolah;
  @JsonKey(name: 'telepon_siswa')
  String? teleponSiswa;
  @JsonKey(name: 'gambar_profil')
  String? gambarProfil;

  Profile({
    this.usernameSiswa,
    this.namaSiswa,
    this.kdSekolah,
    this.namaSekolah,
    this.teleponSiswa,
    this.gambarProfil,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
