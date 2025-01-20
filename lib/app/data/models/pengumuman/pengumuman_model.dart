import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pengumuman_model.g.dart';

PengumumanModel pengumumanModelFromJson(String str) =>
    PengumumanModel.fromJson(json.decode(str));

String pengumumanModelToJson(PengumumanModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PengumumanModel {
  @JsonKey(name: 'file_pdf')
  String? filePdf;
  @JsonKey(name: 'gambar')
  String? gambar;
  @JsonKey(name: 'id_pengumuman')
  String? idPengumuman;
  @JsonKey(name: 'isi_pengumuman')
  String? isiPengumuman;
  @JsonKey(name: 'judul')
  String? judul;
  @JsonKey(name: 'tanggal_posting')
  String? tanggalPosting;
  @JsonKey(name: 'tanggal_exp')
  String? tanggalExp;

  PengumumanModel(
      {this.filePdf,
      this.gambar,
      this.idPengumuman,
      this.isiPengumuman,
      this.judul,
      this.tanggalPosting,
      this.tanggalExp});

  factory PengumumanModel.fromJson(Map<String, dynamic> json) =>
      _$PengumumanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PengumumanModelToJson(this);
}
