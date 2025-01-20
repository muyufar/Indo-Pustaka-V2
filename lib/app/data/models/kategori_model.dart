import 'package:json_annotation/json_annotation.dart';

part 'kategori_model.g.dart';

@JsonSerializable()
class Kategori {
  List<Result>? result;

  Kategori({
    this.result,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) =>
      _$KategoriFromJson(json);

  Map<String, dynamic> toJson() => _$KategoriToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'kd_kategori')
  String? kdKategori;
  @JsonKey(name: 'parent_kategori')
  String? parentKategori;
  @JsonKey(name: 'nama_kategori')
  String? namaKategori;

  Result({
    this.kdKategori,
    this.parentKategori,
    this.namaKategori,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
