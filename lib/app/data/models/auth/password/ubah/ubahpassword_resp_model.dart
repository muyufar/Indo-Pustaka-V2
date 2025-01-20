import 'package:json_annotation/json_annotation.dart';

part 'ubahpassword_resp_model.g.dart';

@JsonSerializable()
class UbahPasswordResponse {
  String? pesan;

  UbahPasswordResponse({this.pesan});

  factory UbahPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UbahPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UbahPasswordResponseToJson(this);
}
