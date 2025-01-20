import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'resp_model.g.dart';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class ResponseModel {
  String? pesan;

  ResponseModel({
    this.pesan,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
