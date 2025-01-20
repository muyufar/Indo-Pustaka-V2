import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/pengumuman/pengumuman_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class PengudetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<PengumumanModel> detailPengumuman(
      String idPengumuman, String idSekolah) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${httpClient.baseUrl}admin/pustaka/api/list_pengumuman.php'));
    request.fields.addAll({
      'id_pengumuman': idPengumuman,
      'id_sekolah': idSekolah,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = pengumumanModelFromJson(resp);

      return model;
    } else {
      throw Exception("Gagal mengambil pengumuman");
    }
  }
}
