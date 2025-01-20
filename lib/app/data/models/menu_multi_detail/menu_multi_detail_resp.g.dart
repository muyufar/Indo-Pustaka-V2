// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_multi_detail_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuMultiDetailResp _$MenuMultiDetailRespFromJson(Map<String, dynamic> json) =>
    MenuMultiDetailResp(
      code: json['code'] as int,
      message: json['message'] as String,
      menuMultiDetailList: (json['data'] as List<dynamic>)
          .map((e) => MenuMultiDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuMultiDetailRespToJson(
        MenuMultiDetailResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.menuMultiDetailList,
    };
