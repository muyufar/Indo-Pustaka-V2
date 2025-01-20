import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

///
LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

///
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'id_anggota')
  String? idAnggota;
  @JsonKey(name: 'kd_sekolah')
  String? kdSekolah;
  String? jabatan;
  String? jenjang;

  LoginResponse({this.idAnggota, this.kdSekolah, this.jabatan, this.jenjang});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
