import 'package:json_annotation/json_annotation.dart';

part 'menu_multi.g.dart';

@JsonSerializable()
class MenuMulti {
  @JsonKey(name: "id_menu")
  String? idMenu;
  @JsonKey(name: "nama_menu")
  String? namaMenu;
  @JsonKey(name: "tipe_menu")
  String? tipeMenu;
  @JsonKey(name: "icon_menu")
  String? iconMenu;
  @JsonKey(name: "tag_menu")
  String? tagMenu;

  MenuMulti({
    this.idMenu,
    this.namaMenu,
    this.tipeMenu,
    this.iconMenu,
    this.tagMenu,
  });

  factory MenuMulti.fromJson(Map<String, dynamic> json) =>
      _$MenuMultiFromJson(json);

  Map<String, dynamic> toJson() => _$MenuMultiToJson(this);
}
