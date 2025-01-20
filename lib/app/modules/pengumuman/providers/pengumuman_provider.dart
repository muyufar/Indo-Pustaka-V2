import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/pengumuman/pengumuman_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class PengumumanProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<List<PengumumanModel>> listPengumunan(String idSekolah) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${httpClient.baseUrl}admin/pustaka/api/list_pengumuman.php'));
    request.fields.addAll({
      'id_sekolah': idSekolah,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = jsonDecode(resp);

      List<PengumumanModel> pengumumanList = model.map<PengumumanModel>((json) {
        return PengumumanModel.fromJson(json);
      }).toList();

      return pengumumanList;
    } else {
      throw Exception("Gagal mengambil pengumuman");
    }
  }
}
