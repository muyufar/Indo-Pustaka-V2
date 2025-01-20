import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/menu/menu_model.dart';
import 'package:indopustaka/app/data/models/menu/menu_resp_model.dart';

import 'package:indopustaka/app/data/string_constants.dart';

class MenuProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return MenuModel.fromJson(map);
      if (map is List) {
        return map.map((item) => MenuModel.fromJson(item)).toList();
      }
    };
    // httpClient.baseUrl = '${StringConstant.webUrl}admin/api/menu_utama';
    httpClient.baseUrl = '${StringConstant.webUrl}admin/api/menu_utama';
  }

  Future<List<MenuResponse>> getMenu(MenuModel menu) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${httpClient.baseUrl}'));
    request.fields.addAll({
      'layanan': menu.layanan.toString(),
      'jabatan': menu.jabatan.toString()
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();

      var model = jsonDecode(resp);

      List<MenuResponse> menuList = model.map<MenuResponse>((json) {
        return MenuResponse.fromJson(json);
      }).toList();

      return menuList;
    } else {
      throw Exception("Gagal mengambil menu");
    }
  }
}
