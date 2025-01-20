import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? username;
  String? password;
  String? kode;
  String? tag;
  @JsonKey(name: 'type_divace')
  String? typeDivace;

  LoginModel(
      {this.username, this.password, this.kode, this.tag, this.typeDivace});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
