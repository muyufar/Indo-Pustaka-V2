import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/mainhome/buku/saya/bukusaya_resp_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class DetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<BukuSayaResponse> getBukuSaya(
      String idUser, int jumlahLimit, String cari) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://lite2.indopustakaplus.com/admin/pustaka/api/list_buku_saya_update.php?id_user=$idUser&jumlahlimit=$jumlahLimit&q=$cari'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = bukuSayaResponseFromJson(resp);

      return model;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}
