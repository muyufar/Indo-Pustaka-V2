import 'dart:convert';

import 'package:get/get.dart';

import '../buku_menu_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class BukuMenuProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return BukuMenu.fromJson(map);
      if (map is List) {
        return map.map((item) => BukuMenu.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${StringConstant.webUrl}admin/pustaka/api/';
  }

  Future<List<dynamic>> getBukuMenu(int jenjang, int jumlahLimit) async {
    final response = await get(
        'MainHome?TAG=bukumenu&jenjang=$jenjang&jumlahlimit=$jumlahLimit');

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.bodyString!)['result'];

      return jsonResponse;
    } else {
      throw Exception("Gagal memuat buku");
    }
  }
}
