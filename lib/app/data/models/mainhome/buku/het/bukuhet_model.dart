import 'package:indopustaka/app/data/models/mainhome/buku/menu/bukumenu_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bukuhet_model.g.dart';

@JsonSerializable()
class BukuHetModel extends BukuMenuModel {
  BukuHetModel({
    super.jenjang,
  }) : super(
          tag: 'bukuhet',
        );

  factory BukuHetModel.fromJson(Map<String, dynamic> json) =>
      _$BukuHetModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BukuHetModelToJson(this);
}
