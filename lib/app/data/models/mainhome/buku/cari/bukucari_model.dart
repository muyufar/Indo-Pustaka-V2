import 'package:indopustaka/app/data/models/mainhome/buku/menu/bukumenu_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bukucari_model.g.dart';

@JsonSerializable()
class BukuCariModel extends BukuMenuModel {
  String? cari;

  @JsonKey(name: 'nama_kategori')
  String? namaKategori;

  String? order;

  BukuCariModel({
    super.jenjang,
    super.jumlahLimit,
    this.cari,
    this.namaKategori,
    this.order,
  }) : super(tag: 'bukucari');

  factory BukuCariModel.fromJson(Map<String, dynamic> json) =>
      _$BukuCariModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BukuCariModelToJson(this);
}
