import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/multimedia/mulmed_resp.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class MultiDetWebProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = '${StringConstant.webUrl}admin/pustaka/api/';
  }

  Future<MulMedResp> getMulMedDetail(
    String tipe,
    String jenjang,
    String offset,
    String limit,
    String idMaster,
  ) async {
    var url = "${httpClient.baseUrl}multimedia";
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    request.fields.addAll({
      'tipe': tipe,
      'jenjang': jenjang,
      'offset': offset,
      'limit': limit,
      'id_master': idMaster,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = multimediaResponseFromJson(resp);

      print("DATAMULTIWEB[Model: $resp]");

      return model;
    } else {
      throw Exception('Gagal memuat detail');
    }
  }
}
