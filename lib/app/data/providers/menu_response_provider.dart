import 'package:get/get.dart';

import '../models/menu_response_model.dart';

class MenuResponseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return MenuResponse.fromJson(map);
      if (map is List) {
        return map.map((item) => MenuResponse.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<MenuResponse?> getMenuResponse(int id) async {
    final response = await get('menuresponse/$id');
    return response.body;
  }

  Future<Response<MenuResponse>> postMenuResponse(
          MenuResponse menuresponse) async =>
      await post('menuresponse', menuresponse);
  Future<Response> deleteMenuResponse(int id) async =>
      await delete('menuresponse/$id');
}
