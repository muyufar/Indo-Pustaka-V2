import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'bukucari_resp_model.g.dart';

BukuCariResponse bukuCariResponseFromJson(String str) =>
    BukuCariResponse.fromJson(json.decode(str));

String bukuCariResponseToJson(BukuCariResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BukuCariResponse {
  @JsonKey(name: 'result')
  List<BukuCari> bukuCariList;

  BukuCariResponse({required this.bukuCariList});

  factory BukuCariResponse.fromJson(Map<String, dynamic> json) =>
      _$BukuCariResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BukuCariResponseToJson(this);
}

@JsonSerializable()
class BukuCari {
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

  BukuCari(
      {this.idBuku,
      this.judul,
      this.sinopsis,
      this.penulis,
      this.penerbit,
      this.kdKategori,
      this.namaKategori,
      this.halaman,
      this.cover,
      this.pdfUrl,
      this.statusFile});

  factory BukuCari.fromJson(Map<String, dynamic> json) =>
      _$BukuCariFromJson(json);

  Map<String, dynamic> toJson() => _$BukuCariToJson(this);
}
