import 'package:get/get.dart';

import '../models/response_model.dart';

class ResponseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ResponseModel.fromJson(map);
      if (map is List) {
        return map.map((item) => ResponseModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ResponseModel?> getResponse(int id) async {
    final response = await get('response/$id');
    return response.body;
  }

  Future<Response<ResponseModel>> postResponse(ResponseModel response) async =>
      await post('response', response);
  Future<Response> deleteResponse(int id) async => await delete('response/$id');
}
