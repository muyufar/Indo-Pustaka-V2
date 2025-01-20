import 'dart:convert';

import 'package:indopustaka/app/data/models/menu_multi/menu_multi.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_multi_resp.g.dart';

MenuMultiResponse menuMultiResponseFromJson(String str) =>
    MenuMultiResponse.fromJson(json.decode(str));

String menuMultiResponseToJson(MenuMultiResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class MenuMultiResponse {
  int code;
  String message;
  @JsonKey(name: 'data')
  List<MenuMulti> menuMultiList;

  MenuMultiResponse({
    required this.code,
    required this.message,
    required this.menuMultiList,
  });

  factory MenuMultiResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuMultiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuMultiResponseToJson(this);
}
