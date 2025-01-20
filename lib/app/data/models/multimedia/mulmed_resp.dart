import 'dart:convert';

import 'package:indopustaka/app/data/models/multimedia/mulmed_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mulmed_resp.g.dart';

MulMedResp multimediaResponseFromJson(String str) =>
    MulMedResp.fromJson(json.decode(str));

String multimediaResponseToJson(MulMedResp data) => json.encode(data.toJson());

@JsonSerializable()
class MulMedResp {
  int? code;
  String? message;
  @JsonKey(name: 'data')
  MulMedModel? mulmed;

  MulMedResp({
    this.code,
    this.message,
    this.mulmed,
  });

  factory MulMedResp.fromJson(Map<String, dynamic> json) =>
      _$MulMedRespFromJson(json);

  Map<String, dynamic> toJson() => _$MulMedRespToJson(this);
}
