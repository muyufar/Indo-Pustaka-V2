import 'package:json_annotation/json_annotation.dart';

part 'menu_multi_detail.g.dart';

@JsonSerializable()
class MenuMultiDetail {
  @JsonKey(name: "id_master")
  String? idMaster;
  String? judul;
  String? cover;
  @JsonKey(name: "url_master")
  String? urlMaster;
  @JsonKey(name: "gambar_unduh")
  String? gambarUnduh;
  @JsonKey(name: "jumlah_pembaca")
  int? jumlahPembaca;
  String? penulis;
  String? penerbit;
  @JsonKey(name: "cover_buku")
  String? coverBuku;
  String? orientasi;

  MenuMultiDetail({
    this.idMaster,
    this.judul,
    this.cover,
    this.urlMaster,
    this.gambarUnduh,
    this.jumlahPembaca,
    this.penulis,
    this.penerbit,
    this.coverBuku,
    this.orientasi,
  });

  factory MenuMultiDetail.fromJson(Map<String, dynamic> json) =>
      _$MenuMultiDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MenuMultiDetailToJson(this);
}
