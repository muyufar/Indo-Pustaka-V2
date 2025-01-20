import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'perpus_riwayat_model.g.dart';

PerpusRiwayatResponse perpusRiwayatResponseFromJson(String str) =>
    PerpusRiwayatResponse.fromJson(json.decode(str));

String perpusRiwayatToJson(PerpusRiwayatResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PerpusRiwayatResponse {
  @JsonKey(name: 'result')
  List<PerpusRiwayatModel> perpusRiwayatList;

  PerpusRiwayatResponse({required this.perpusRiwayatList});

  factory PerpusRiwayatResponse.fromJson(Map<String, dynamic> json) =>
      _$PerpusRiwayatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PerpusRiwayatResponseToJson(this);
}

@JsonSerializable()
class PerpusRiwayatModel {
  @JsonKey(name: "id_peminjaman_model")
  String? idPeminjamanModel;
  @JsonKey(name: "kode_pinjam_fisik")
  String? kodePinjamFisik;
  @JsonKey(name: "id_buku_fisik")
  String? idBukuFisik;
  @JsonKey(name: "judul")
  String? judul;
  @JsonKey(name: "penulis")
  String? penulis;
  @JsonKey(name: "penerbit")
  String? penerbit;
  @JsonKey(name: "status_peminjaman_fisik")
  String? statusPeminjamanFisik;
  @JsonKey(name: "tanggal_peminjaman_fisik")
  String? tanggalPeminjamanFisik;
  @JsonKey(name: "tanggal_exp_peminjaman_fisik")
  String? tanggalExpPeminjamanFisik;
  @JsonKey(name: "jumlah_peminjaman_fisik")
  String? jumlahPeminjamanFisik;
  @JsonKey(name: "cover")
  String? cover;

  PerpusRiwayatModel({
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

  factory PerpusRiwayatModel.fromJson(Map<String, dynamic> json) =>
      _$PerpusRiwayatModelFromJson(json);

  Map<String, dynamic> toJson() => _$PerpusRiwayatModelToJson(this);
}
