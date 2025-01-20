
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/menu_multi/menu_multi_resp.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class MultimediaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = '${StringConstant.webUrl}admin/pustaka/api/';
  }

  Future<MenuMultiResponse> getMenuMulti() async {
    var request = http.MultipartRequest(
      'GET',
      Uri.parse('${httpClient.baseUrl}menu_multimedia'),
    );

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();

      return menuMultiResponseFromJson(resp);
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}
