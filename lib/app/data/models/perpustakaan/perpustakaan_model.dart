import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'perpustakaan_model.g.dart';

PerpustakaanResponse perpustakaanResponseFromJson(String str) =>
    PerpustakaanResponse.fromJson(json.decode(str));

String perpustakaanResponseToJson(PerpustakaanResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PerpustakaanResponse {
  @JsonKey(name: 'result')
  List<PerpustakaanModel> perpustakaanList;

  PerpustakaanResponse({required this.perpustakaanList});

  factory PerpustakaanResponse.fromJson(Map<String, dynamic> json) =>
      _$PerpustakaanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PerpustakaanResponseToJson(this);
}

@JsonSerializable()
class PerpustakaanModel {
  @JsonKey(name: 'id_buku_fisik')
  String? idBukuFisik;
  String? judul;
  String? sinopsis;
  String? penulis;
  String? penerbit;
  @JsonKey(name: 'kd_kategori')
  String? kodeKategori;
  @JsonKey(name: 'nama_kategori')
  String? namaKategori;
  String? halaman;
  String? cover;
  @JsonKey(name: 'stok_buku')
  String? stokBuku;

  PerpustakaanModel({
    this.idBukuFisik,
    this.judul,
    this.sinopsis,
    this.penulis,
    this.penerbit,
    this.kodeKategori,
    this.namaKategori,
    this.halaman,
    this.cover,
    this.stokBuku,
  });

  factory PerpustakaanModel.fromJson(Map<String, dynamic> json) =>
      _$PerpustakaanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PerpustakaanModelToJson(this);
}
