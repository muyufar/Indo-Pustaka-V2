// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bukuhet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuHetModel _$BukuHetModelFromJson(Map<String, dynamic> json) => BukuHetModel(
      jenjang: json['jenjang'] as String?,
    )
      ..tag = json['TAG'] as String?
      ..jumlahLimit = json['jumlahlimit'] as String?;

Map<String, dynamic> _$BukuHetModelToJson(BukuHetModel instance) =>
    <String, dynamic>{
      'TAG': instance.tag,
      'jenjang': instance.jenjang,
      'jumlahlimit': instance.jumlahLimit,
    };
