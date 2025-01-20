import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/modules/login/login_model.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Login.fromJson(map);
      if (map is List) return map.map((item) => Login.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${StringConstant.webUrl}admin/api';
  }

Future<http.StreamedResponse> guru(String idAnggota) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${httpClient.baseUrl}/guru/guru'));
    request.fields.addAll({
      'id_anggota': idAnggota,
    });

    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<http.StreamedResponse> siswa(String idAnggota) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${httpClient.baseUrl}/siswa/siswa'));
    request.fields.addAll({
      'id_anggota': idAnggota,
    });

    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<http.StreamedResponse> login(Login login) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${httpClient.baseUrl}/login'));
    request.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
    });
    request.fields.addAll({
      'username': login.username!,
      'password': login.password!,
      'kode': login.kode!,
      'tag': login.tag!,
      'type_divace': login.typeDivace!
    });

    http.StreamedResponse response = await request.send();

    return response;
  }
}
