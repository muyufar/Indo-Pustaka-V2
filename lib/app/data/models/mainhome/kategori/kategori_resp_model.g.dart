// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategori_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KategoriResponse _$KategoriResponseFromJson(Map<String, dynamic> json) =>
    KategoriResponse(
      kategoriList: (json['result'] as List<dynamic>)
          .map((e) => Kategori.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KategoriResponseToJson(KategoriResponse instance) =>
    <String, dynamic>{
      'result': instance.kategoriList,
    };

Kategori _$KategoriFromJson(Map<String, dynamic> json) => Kategori(
      kdKategori: json['kd_kategori'] as String?,
      parentKategori: json['parent_kategori'] as String?,
      namaKategori: json['nama_kategori'] as String?,
    );

Map<String, dynamic> _$KategoriToJson(Kategori instance) => <String, dynamic>{
      'kd_kategori': instance.kdKategori,
      'parent_kategori': instance.parentKategori,
      'nama_kategori': instance.namaKategori,
    };
