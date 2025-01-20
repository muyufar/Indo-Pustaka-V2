import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'riwayat_perpus_model.g.dart';

RiwayatPerpusResponse riwayatPerpusResponseFromJson(String str) =>
    RiwayatPerpusResponse.fromJson(json.decode(str));

String riwayatPerpusResponseToJson(RiwayatPerpusResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class RiwayatPerpusResponse {
  @JsonKey(name: 'result')
  List<RiwayatPerpus> riwayatPerpusList;

  RiwayatPerpusResponse({required this.riwayatPerpusList});

  factory RiwayatPerpusResponse.fromJson(Map<String, dynamic> json) =>
      _$RiwayatPerpusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RiwayatPerpusResponseToJson(this);
}

@JsonSerializable()
class RiwayatPerpus {
  @JsonKey(name: 'id_peminjaman_model')
  String? idPeminjamanModel;

  @JsonKey(name: 'kode_pinjam_fisik')
  String? kodePinjamFisik;

  @JsonKey(name: 'id_buku_fisik')
  String? idBukuFisik;

  String? judul;
  String? penulis;
  String? penerbit;

  @JsonKey(name: 'status_peminjaman_fisik')
  String? statusPeminjamanFisik;

  @JsonKey(name: 'tanggal_peminjaman_fisik')
  String? tanggalPeminjamanFisik;

  @JsonKey(name: 'tanggal_exp_peminjaman_fisik')
  String? tanggalExpPeminjamanFisik;

  @JsonKey(name: 'jumlah_peminjaman_fisik')
  String? jumlahPeminjamanFisik;

  String? cover;

  RiwayatPerpus({
    this.idPeminjamanModel,
    this.kodePinjamFisik,
    this.idBukuFisik,
    this.judul,
    this.penulis,
    this.penerbit,
    this.statusPeminjamanFisik,
    this.tanggalPeminjamanFisik,
    this.tanggalExpPeminjamanFisik,
    this.jumlahPeminjamanFisik,
    this.cover,
  });

  factory RiwayatPerpus.fromJson(Map<String, dynamic> json) =>
      _$RiwayatPerpusFromJson(json);

  Map<String, dynamic> toJson() => _$RiwayatPerpusToJson(this);
}
