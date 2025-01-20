// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bukucari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuCariModel _$BukuCariModelFromJson(Map<String, dynamic> json) =>
    BukuCariModel(
      jenjang: json['jenjang'] as String?,
      jumlahLimit: json['jumlahlimit'] as String?,
      cari: json['cari'] as String?,
      namaKategori: json['nama_kategori'] as String?,
      order: json['order'] as String?,
    )..tag = json['TAG'] as String?;

Map<String, dynamic> _$BukuCariModelToJson(BukuCariModel instance) =>
    <String, dynamic>{
      'TAG': instance.tag,
      'jenjang': instance.jenjang,
      'jumlahlimit': instance.jumlahLimit,
      'cari': instance.cari,
      'nama_kategori': instance.namaKategori,
      'order': instance.order,
    };
