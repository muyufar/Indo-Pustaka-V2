import 'package:indopustaka/app/data/models/mainhome/mainhome_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bukumenu_model.g.dart';

@JsonSerializable()
class BukuMenuModel extends MainHomeModel {
  @JsonKey(name: 'jumlahlimit')
  String? jumlahLimit;

  BukuMenuModel({
    super.tag = 'bukumenu',
    super.jenjang,
    this.jumlahLimit,
  });

  factory BukuMenuModel.fromJson(Map<String, dynamic> json) =>
      _$BukuMenuModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BukuMenuModelToJson(this);
}
