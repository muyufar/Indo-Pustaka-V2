import 'package:indopustaka/app/data/models/mainhome/mainhome_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kategori_model.g.dart';

@JsonSerializable()
class KategoriModel extends MainHomeModel {
  KategoriModel({super.jenjang}) : super(tag: 'kategori');

  factory KategoriModel.fromJson(Map<String, dynamic> json) =>
      _$KategoriModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KategoriModelToJson(this);
}
