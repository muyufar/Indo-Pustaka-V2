import 'package:json_annotation/json_annotation.dart';

part 'ubahpassword_model.g.dart';

@JsonSerializable()
class UbahPassword {
  String? username;
  String? newPass;

  UbahPassword({this.username, this.newPass});

  factory UbahPassword.fromJson(Map<String, dynamic> json) =>
      _$UbahPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$UbahPasswordToJson(this);
}
