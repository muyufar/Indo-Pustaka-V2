import 'package:json_annotation/json_annotation.dart';

part 'buku_detail_model_model.g.dart';

@JsonSerializable()
class BukuDetailModel {
  List<Result>? result;

  BukuDetailModel({
    this.result,
  });

  factory BukuDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BukuDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$BukuDetailModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'id_buku')
  String? idBuku;
  String? judul;
  String? sinopsis;
  String? penulis;
  String? penerbit;
  @JsonKey(name: 'kd_kategori')
  String? kdKategori;
  @JsonKey(name: 'nama_kategori')
  String? namaKategori;
  String? halaman;
  String? cover;
  @JsonKey(name: 'pdf_url')
  String? pdfUrl;
  @JsonKey(name: 'status_file')
  String? statusFile;
  @JsonKey(name: 'status_bookmark')
  String? statusBookmark;
  @JsonKey(name: 'stok_buku_format')
  String? stokBukuFormat;
  @JsonKey(name: 'stok_buku')
  String? stokBuku;

  Result({
    this.idBuku,
    this.judul,
    this.sinopsis,
    this.penulis,
    this.penerbit,
    this.kdKategori,
    this.namaKategori,
    this.halaman,
    this.cover,
    this.pdfUrl,
    this.statusFile,
    this.statusBookmark,
    this.stokBukuFormat,
    this.stokBuku,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
