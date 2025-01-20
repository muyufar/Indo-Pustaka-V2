// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategori_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kategori _$KategoriFromJson(Map<String, dynamic> json) => Kategori(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KategoriToJson(Kategori instance) => <String, dynamic>{
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      kdKategori: json['kd_kategori'] as String?,
      parentKategori: json['parent_kategori'] as String?,
      namaKategori: json['nama_kategori'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'kd_kategori': instance.kdKategori,
      'parent_kategori': instance.parentKategori,
      'nama_kategori': instance.namaKategori,
    };
