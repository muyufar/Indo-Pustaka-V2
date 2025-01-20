import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'bukudetail_resp_model.g.dart';

BukuDetailResponse bukuDetailResponseFromJson(String str) =>
    BukuDetailResponse.fromJson(json.decode(str));

String bukuDetailResponseToJson(BukuDetailResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BukuDetailResponse {
  @JsonKey(name: 'result')
  List<BukuDetail> bukuDetailList;

  BukuDetailResponse({required this.bukuDetailList});

  factory BukuDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BukuDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BukuDetailResponseToJson(this);
}

@JsonSerializable()
class BukuDetail {
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

  BukuDetail(
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
      this.statusFile,
      this.statusBookmark,
      this.stokBukuFormat,
      this.stokBuku});

  factory BukuDetail.fromJson(Map<String, dynamic> json) =>
      _$BukuDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BukuDetailToJson(this);
}
