import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/perpustakaan/perpustakaan_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class PerpustakaanProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return PerpustakaanModel.fromJson(map);
      }

      if (map is List) {
        return map.map((item) => PerpustakaanModel.fromJson(item)).toList();
      }
    };

    httpClient.baseUrl = '${StringConstant.webUrl}admin/pustaka/api/MainFisik';
  }

  Future<PerpustakaanResponse> listPerpus(String idSekolah) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${httpClient.baseUrl}'));
    request.fields.addAll({
      'TAG': 'bukufisik',
      'id_sekolah': idSekolah,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = perpustakaanResponseFromJson(resp);

      return model;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  Future<List<PerpustakaanModel>> listRiwayatPinjam(
      String idUserFisik, String jumlahLimit) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${httpClient.baseUrl}'));
    request.fields.addAll({
      'TAG': 'riwayatpeminjaman',
      'id_user_fisik': idUserFisik,
      'jumlahlimit': jumlahLimit,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = jsonDecode(resp);

      List<PerpustakaanModel> perpustakaanList =
          model.map<PerpustakaanModel>((json) {
        return PerpustakaanModel.fromJson(json);
      }).toList();

      return perpustakaanList;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}
