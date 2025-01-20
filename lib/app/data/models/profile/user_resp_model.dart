import 'package:json_annotation/json_annotation.dart';

part 'user_resp_model.g.dart';

@JsonSerializable()
class UserResponse {
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

  UserResponse(
      {this.usernameSiswa,
      this.namaSiswa,
      this.kdSekolah,
      this.namaSekolah,
      this.teleponSiswa,
      this.gambarProfil});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
