// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      idAnggota: json['id_anggota'] as String?,
      kdSekolah: json['kd_sekolah'] as String?,
      jabatan: json['jabatan'] as String?,
      jenjang: json['jenjang'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id_anggota': instance.idAnggota,
      'kd_sekolah': instance.kdSekolah,
      'jabatan': instance.jabatan,
      'jenjang': instance.jenjang,
    };
