import 'package:json_annotation/json_annotation.dart';

part 'kategori_resp_model.g.dart';

@JsonSerializable()
class KategoriResponse {
  @JsonKey(name: 'result')
  List<Kategori> kategoriList;

  KategoriResponse({required this.kategoriList});

  factory KategoriResponse.fromJson(Map<String, dynamic> json) =>
      _$KategoriResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KategoriResponseToJson(this);
}

@JsonSerializable()
class Kategori {
  @JsonKey(name: 'kd_kategori')
  String? kdKategori;

  @JsonKey(name: 'parent_kategori')
  String? parentKategori;

  @JsonKey(name: 'nama_kategori')
  String? namaKategori;

  Kategori({
    this.kdKategori,
    this.parentKategori,
    this.namaKategori,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) =>
      _$KategoriFromJson(json);

  Map<String, dynamic> toJson() => _$KategoriToJson(this);
}
