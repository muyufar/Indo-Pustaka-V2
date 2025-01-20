import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/mainhome/kategori/kategori_resp_model.dart';

import 'package:indopustaka/app/data/string_constants.dart';

class KategoriProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return KategoriResponse.fromJson(map);
      if (map is List) {
        return map.map((item) => KategoriResponse.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<KategoriResponse> getKategori(int jenjang) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${httpClient.baseUrl}admin/pustaka/api/MainHome'));
    request.fields.addAll({
      'TAG': 'kategori',
      'jenjang': jenjang.toString(),
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = KategoriResponse.fromJson(jsonDecode(resp));

      return model;
    } else {
      throw Exception("Gagal mengambil kategori");
    }
  }

  Future<KategoriResponse> listKategori(String idSekolah) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${httpClient.baseUrl}admin/pustaka/api/MainFisik'));
    request.fields.addAll({
      'TAG': 'kategori',
      'id_sekolah': idSekolah,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = KategoriResponse.fromJson(jsonDecode(resp));

      return model;
    } else {
      throw Exception("Gagal mengambil kategori");
    }
  }
}
