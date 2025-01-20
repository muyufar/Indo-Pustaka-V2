// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategori_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KategoriModel _$KategoriModelFromJson(Map<String, dynamic> json) =>
    KategoriModel(
      jenjang: json['jenjang'] as String?,
    )..tag = json['TAG'] as String?;

Map<String, dynamic> _$KategoriModelToJson(KategoriModel instance) =>
    <String, dynamic>{
      'TAG': instance.tag,
      'jenjang': instance.jenjang,
    };
