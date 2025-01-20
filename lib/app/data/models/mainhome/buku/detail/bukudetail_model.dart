import 'package:indopustaka/app/data/models/mainhome/mainhome_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bukudetail_model.g.dart';

@JsonSerializable()
class BukuDetailModel extends MainHomeModel {
  @JsonKey(name: 'id_buku')
  String? idBuku;

  @JsonKey(name: 'id_sekolah')
  String? idSekolah;

  @JsonKey(name: 'id_user')
  String? idUser;

  BukuDetailModel({
    super.jenjang,
    this.idBuku,
    this.idSekolah,
    this.idUser,
  }) : super(tag: 'bukudetail');

  factory BukuDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BukuDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BukuDetailModelToJson(this);
}
