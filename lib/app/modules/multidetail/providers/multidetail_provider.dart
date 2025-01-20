import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/menu_multi_detail/menu_multi_detail_resp.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class MultidetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = '${StringConstant.webUrl}admin/pustaka/api/multimedia';
  }

  Future<MenuMultiDetailResp> getMenuMultiDetail(
    String tipe,
    String jenjang,
    String offset,
    String limit,
    String cari,
  ) async {
    var url =
        "${httpClient.baseUrl}?tipe=$tipe&jenjang=$jenjang&offset=$offset&limit=$limit&q=$cari";
    var request = http.MultipartRequest(
      'GET',
      Uri.parse(url),
    );

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();

      return menuMultiDetailRespFromJson(resp);
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}
