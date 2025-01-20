// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      username: json['username'] as String?,
      password: json['password'] as String?,
      kode: json['kode'] as String?,
      tag: json['tag'] as String?,
      typeDivace: json['type_divace'] as String?,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'kode': instance.kode,
      'tag': instance.tag,
      'type_divace': instance.typeDivace,
    };
