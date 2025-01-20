import 'package:json_annotation/json_annotation.dart';

part 'menu_response_model.g.dart';

@JsonSerializable()
class MenuResponse {
  @JsonKey(name: 'id_menu_layanan')
  String? idMenuLayanan;
  @JsonKey(name: 'kd_menu_akses')
  String? kdMenuAkses;
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
  @JsonKey(name: 'tgl_posting_menu')
  String? tglPostingMenu;
  @JsonKey(name: 'status_aktif_menu')
  String? statusAktifMenu;

  MenuResponse({
    this.idMenuLayanan,
    this.kdMenuAkses,
    this.layanan,
    this.idMenu,
    this.namaMenu,
    this.deskripsiMenu,
    this.tagMenu,
    this.hakAkses,
    this.iconMenu,
    this.tglPostingMenu,
    this.statusAktifMenu,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);
}
