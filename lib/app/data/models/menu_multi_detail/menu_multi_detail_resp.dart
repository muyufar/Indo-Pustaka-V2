import 'dart:convert';

import 'package:indopustaka/app/data/models/menu_multi_detail/menu_multi_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_multi_detail_resp.g.dart';

MenuMultiDetailResp menuMultiDetailRespFromJson(String str) =>
    MenuMultiDetailResp.fromJson(json.decode(str));

String menuMultiResponseToJson(MenuMultiDetailResp data) =>
    json.encode(data.toJson());

@JsonSerializable()
class MenuMultiDetailResp {
  int code;
  String message;
  @JsonKey(name: "data")
  List<MenuMultiDetail> menuMultiDetailList;

  MenuMultiDetailResp({
    required this.code,
    required this.message,
    required this.menuMultiDetailList,
  });

  factory MenuMultiDetailResp.fromJson(Map<String, dynamic> json) =>
      _$MenuMultiDetailRespFromJson(json);

  Map<String, dynamic> toJson() => _$MenuMultiDetailRespToJson(this);
}
