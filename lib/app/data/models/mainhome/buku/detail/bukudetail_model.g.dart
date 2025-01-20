// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bukudetail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuDetailModel _$BukuDetailModelFromJson(Map<String, dynamic> json) =>
    BukuDetailModel(
      jenjang: json['jenjang'] as String?,
      idBuku: json['id_buku'] as String?,
      idSekolah: json['id_sekolah'] as String?,
      idUser: json['id_user'] as String?,
    )..tag = json['TAG'] as String?;

Map<String, dynamic> _$BukuDetailModelToJson(BukuDetailModel instance) =>
    <String, dynamic>{
      'TAG': instance.tag,
      'jenjang': instance.jenjang,
      'id_buku': instance.idBuku,
      'id_sekolah': instance.idSekolah,
      'id_user': instance.idUser,
    };
