// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      idAnggota: json['id_anggota'] as String?,
      noHp: json['noHp'] as String?,
      nama: json['nama'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id_anggota': instance.idAnggota,
      'noHp': instance.noHp,
      'nama': instance.nama,
    };
