// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_multi_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuMultiResponse _$MenuMultiResponseFromJson(Map<String, dynamic> json) =>
    MenuMultiResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      menuMultiList: (json['data'] as List<dynamic>)
          .map((e) => MenuMulti.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuMultiResponseToJson(MenuMultiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.menuMultiList,
    };
