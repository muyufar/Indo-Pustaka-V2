// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buku_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuDetail _$BukuDetailFromJson(Map<String, dynamic> json) => BukuDetail(
      tag: json['tag'] as String?,
      jenjang: json['jenjang'] as String?,
      idBuku: json['id_buku'] as String?,
      idSekolah: json['id_sekolah'] as String?,
      idUser: json['id_user'] as String?,
    );

Map<String, dynamic> _$BukuDetailToJson(BukuDetail instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'jenjang': instance.jenjang,
      'id_buku': instance.idBuku,
      'id_sekolah': instance.idSekolah,
      'id_user': instance.idUser,
    };
