import 'package:json_annotation/json_annotation.dart';

part 'buku_menu_model.g.dart';

@JsonSerializable()
class BukuMenu {
  List<Result>? result;

  BukuMenu({
    this.result,
  });

  factory BukuMenu.fromJson(Map<String, dynamic> json) =>
      _$BukuMenuFromJson(json);

  Map<String, dynamic> toJson() => _$BukuMenuToJson(this);
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
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
