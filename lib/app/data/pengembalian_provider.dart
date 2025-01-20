import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class PengembalianProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<http.StreamedResponse> kembalikanPinjaman(
      String idBuku, String idUser, String idSekolah) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${httpClient.baseUrl}admin/pustaka/api/kembalikkan_peminjaman.php'));
    request.fields.addAll({
      'id_buku': idBuku,
      'id_user': idUser,
      'id_sekolah': idSekolah,
    });

    http.StreamedResponse response = await request.send();

    return response;
  }
}
