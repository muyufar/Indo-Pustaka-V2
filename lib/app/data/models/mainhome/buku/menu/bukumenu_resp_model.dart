import 'package:json_annotation/json_annotation.dart';

part 'bukumenu_resp_model.g.dart';

@JsonSerializable()
class BukuMenuResponse {
  @JsonKey(name: 'result')
  List<BukuMenu> bukuMenuList;

  BukuMenuResponse({required this.bukuMenuList});

  factory BukuMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$BukuMenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BukuMenuResponseToJson(this);
}

@JsonSerializable()
class BukuMenu {
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

  BukuMenu({
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

  factory BukuMenu.fromJson(Map<String, dynamic> json) =>
      _$BukuMenuFromJson(json);

  Map<String, dynamic> toJson() => _$BukuMenuToJson(this);
}
