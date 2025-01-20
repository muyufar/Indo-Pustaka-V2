import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'menu_resp_model.g.dart';

MenuResponse menuResponseFromJson(String str) =>
    MenuResponse.fromJson(json.decode(str));

@JsonSerializable()
class MenuResponse {
  @JsonKey(name: 'id_menu_layanan')
  String? idMenuLayanan;

  @JsonKey(name: 'kd_menu_akses')
  String? kdMenuAkses;

  @JsonKey(name: 'layanan')
  String? layanan;

  @JsonKey(name: 'id_menu')
  String? idMenu;

  @JsonKey(name: 'nama_menu')
  String? namaMenu;

  @JsonKey(name: 'deskripsi_menu')
  String? deskripsiMenu;

  @JsonKey(name: 'tag_menu')
  String? tagMenu;

  @JsonKey(name: 'hak_akses')
  String? hakAkses;

  @JsonKey(name: 'icon_menu')
  String? iconMenu;

  MenuResponse(
      {this.idMenuLayanan,
      this.kdMenuAkses,
      this.layanan,
      this.idMenu,
      this.namaMenu,
      this.deskripsiMenu,
      this.tagMenu,
      this.hakAkses,
      this.iconMenu});

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);
}
