import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class Login {
  String? username;
  String? password;
  String? kode;
  String? tag;
  @JsonKey(name: 'type_divace')
  String? typeDivace;

  Login({
    this.username,
    this.password,
    this.kode,
    this.tag,
    this.typeDivace,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
