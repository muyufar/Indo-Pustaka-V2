import 'package:json_annotation/json_annotation.dart';

part 'mulmed_model.g.dart';

@JsonSerializable()
class MulMedModel {
  @JsonKey(name: 'id_master')
  String? idMaster;
  String? judul;
  String? cover;
  @JsonKey(name: 'url_master')
  String? urlMaster;
  @JsonKey(name: 'gambar_unduh')
  String? gambarUnduh;
  @JsonKey(name: 'jumlah_pembaca')
  int? jumlahPembaca;
  @JsonKey(name: 'judul_buku')
  String? judulBuku;
  String? penulis;
  @JsonKey(name: 'cover_buku')
  String? coverBuku;
  String? orientasi;

  MulMedModel({
    this.idMaster,
    this.judul,
    this.cover,
    this.urlMaster,
    this.gambarUnduh,
    this.jumlahPembaca,
    this.judulBuku,
    this.penulis,
    this.coverBuku,
    this.orientasi,
  });

  factory MulMedModel.fromJson(Map<String, dynamic> json) =>
      _$MulMedModelFromJson(json);

  Map<String, dynamic> toJson() => _$MulMedModelToJson(this);
}
