import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'bukusaya_resp_model.g.dart';

BukuSayaResponse bukuSayaResponseFromJson(String str) =>
    BukuSayaResponse.fromJson(json.decode(str));

String bukuSayaResponseToJson(BukuSayaResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BukuSayaResponse {
  @JsonKey(name: 'result')
  List<BukuSaya> bukuSayaList;

  BukuSayaResponse({required this.bukuSayaList});

  factory BukuSayaResponse.fromJson(Map<String, dynamic> json) =>
      _$BukuSayaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BukuSayaResponseToJson(this);
}

@JsonSerializable()
class BukuSaya {
  @JsonKey(name: 'id_peminjaman')
  String? idPeminjaman;

  @JsonKey(name: 'kode_pinjam')
  String? kodePinjam;

  @JsonKey(name: 'id_buku')
  String? idBuku;

  String? judul;
  String? sinopsis;
  String? penulis;
  String? penerbit;

  @JsonKey(name: 'status_peminjaman')
  String? statusPeminjaman;

  @JsonKey(name: 'tanggal_posting')
  String? tanggalPosting;

  @JsonKey(name: 'tanggal_exp_peminjaman')
  String? tanggalExpPeminjaman;

  @JsonKey(name: 'kd_kategori')
  String? kdKategori;

  @JsonKey(name: 'nama_kategori')
  String? namaKategori;

  String? halaman;
  String? cover;

  @JsonKey(name: 'pdf_url')
  String? pdfUrl;

  BukuSaya(
      {this.idPeminjaman,
      this.kodePinjam,
      this.idBuku,
      this.judul,
      this.sinopsis,
      this.penulis,
      this.penerbit,
      this.statusPeminjaman,
      this.tanggalPosting,
      this.tanggalExpPeminjaman,
      this.kdKategori,
      this.namaKategori,
      this.halaman,
      this.cover,
      this.pdfUrl});

  factory BukuSaya.fromJson(Map<String, dynamic> json) =>
      _$BukuSayaFromJson(json);

  Map<String, dynamic> toJson() => _$BukuSayaToJson(this);
}
