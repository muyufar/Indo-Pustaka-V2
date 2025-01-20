import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'res_model.g.dart';

ResModel resModelFromJson(String str) => ResModel.fromJson(json.decode(str));

@JsonSerializable()
class ResModel {
  String? response;
  String? message;

  ResModel({
    this.response,
    this.message,
  });

  factory ResModel.fromJson(Map<String, dynamic> json) =>
      _$ResModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResModelToJson(this);
}
