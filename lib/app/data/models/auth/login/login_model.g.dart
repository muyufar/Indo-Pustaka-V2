// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String?,
      password: json['password'] as String?,
      kode: json['kode'] as String?,
      tag: json['tag'] as String?,
      typeDivace: json['type_divace'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'kode': instance.kode,
      'tag': instance.tag,
      'type_divace': instance.typeDivace,
    };
