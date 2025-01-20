import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/mainhome/buku/het/bukuhet_resp_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class HetBukuProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<BukuHetResponse> getBukuHet(String idSekolah, int jumlahLimit) async {
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            '${httpClient.baseUrl}admin/pustaka/api/list_buku_het.php?id_sekolah=$idSekolah&jumlahlimit=$jumlahLimit&cari'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();

      return bukuHetResponseFromJson(resp);
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
