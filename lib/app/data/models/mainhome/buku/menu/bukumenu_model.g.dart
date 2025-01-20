// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bukumenu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuMenuModel _$BukuMenuModelFromJson(Map<String, dynamic> json) =>
    BukuMenuModel(
      tag: json['TAG'] as String? ?? 'bukumenu',
      jenjang: json['jenjang'] as String?,
      jumlahLimit: json['jumlahlimit'] as String?,
    );

Map<String, dynamic> _$BukuMenuModelToJson(BukuMenuModel instance) =>
    <String, dynamic>{
      'TAG': instance.tag,
      'jenjang': instance.jenjang,
      'jumlahlimit': instance.jumlahLimit,
    };
