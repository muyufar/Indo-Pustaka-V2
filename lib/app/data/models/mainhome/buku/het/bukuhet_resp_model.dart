import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'bukuhet_resp_model.g.dart';

BukuHetResponse bukuHetResponseFromJson(String str) =>
    BukuHetResponse.fromJson(json.decode(str));

String bukuHetResponseToJson(BukuHetResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BukuHetResponse {
  @JsonKey(name: 'result')
  List<BukuHet> bukuHetList;

  BukuHetResponse({required this.bukuHetList});

  factory BukuHetResponse.fromJson(Map<String, dynamic> json) =>
      _$BukuHetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BukuHetResponseToJson(this);
}

@JsonSerializable()
class BukuHet {
  @JsonKey(name: 'id_buku')
  String? idBuku;

  @JsonKey(name: 'judul')
  String? judul;

  @JsonKey(name: 'sinopsis')
  String? sinopsis;

  @JsonKey(name: 'penulis')
  String? penulis;

  @JsonKey(name: 'penerbit')
  String? penerbit;

  @JsonKey(name: 'kd_kategori')
  String? kdKategori;

  @JsonKey(name: 'nama_kategori')
  String? namaKategori;

  @JsonKey(name: 'halaman')
  String? halaman;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'pdf_url')
  String? pdfUrl;

  @JsonKey(name: 'status_file')
  String? statusFile;

  BukuHet(
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

  factory BukuHet.fromJson(Map<String, dynamic> json) =>
      _$BukuHetFromJson(json);

  Map<String, dynamic> toJson() => _$BukuHetToJson(this);
}
