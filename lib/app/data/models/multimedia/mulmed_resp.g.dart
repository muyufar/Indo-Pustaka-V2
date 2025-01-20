// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mulmed_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MulMedResp _$MulMedRespFromJson(Map<String, dynamic> json) => MulMedResp(
      code: json['code'] as int?,
      message: json['message'] as String?,
      mulmed: json['data'] == null
          ? null
          : MulMedModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MulMedRespToJson(MulMedResp instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.mulmed,
    };
