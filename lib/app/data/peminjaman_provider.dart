import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/string_constants.dart';

class PeminjamanProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<http.StreamedResponse> tambahPinjaman(
      String idBuku, String idUser, String idSekolah, String jenjang) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('${httpClient.baseUrl}admin/pustaka/api/tambah_peminjaman.php'));
    request.fields.addAll({
      'id_buku': idBuku,
      'id_user': idUser,
      'id_sekolah': idSekolah,
      'jenjang': jenjang
    });

    http.StreamedResponse response = await request.send();

    return response;
  }
}
