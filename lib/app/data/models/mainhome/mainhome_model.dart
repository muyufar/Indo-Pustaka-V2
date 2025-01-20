import 'package:json_annotation/json_annotation.dart';

part 'mainhome_model.g.dart';

@JsonSerializable()
class MainHomeModel {
  @JsonKey(name: 'TAG')
  String? tag;
  String? jenjang;

  MainHomeModel({this.tag, this.jenjang});

  factory MainHomeModel.fromJson(Map<String, dynamic> json) =>
      _$MainHomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainHomeModelToJson(this);
}
