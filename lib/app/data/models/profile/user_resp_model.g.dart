// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      usernameSiswa: json['username_siswa'] as String?,
      namaSiswa: json['nama_siswa'] as String?,
      kdSekolah: json['kd_sekolah'] as String?,
      namaSekolah: json['nama_sekolah'] as String?,
      teleponSiswa: json['telepon_siswa'] as String?,
      gambarProfil: json['gambar_profil'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'username_siswa': instance.usernameSiswa,
      'nama_siswa': instance.namaSiswa,
      'kd_sekolah': instance.kdSekolah,
      'nama_sekolah': instance.namaSekolah,
      'telepon_siswa': instance.teleponSiswa,
      'gambar_profil': instance.gambarProfil,
    };
