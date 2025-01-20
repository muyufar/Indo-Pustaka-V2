import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/mainhome/buku/cari/bukucari_resp_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class EbookProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<BukuCariResponse> cariBuku(int jenjang, int jumlahLimit,
      String namaKategori, String cari, int order) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('${httpClient.baseUrl}admin/pustaka/api/MainBukuKategori'));
    request.fields.addAll(
      {
        'TAG': 'bukucari',
        'jenjang': jenjang.toString(),
        'jumlahlimit': jumlahLimit.toString(),
        'cari': cari,
        'nama_kategori': namaKategori,
        'order': order.toString(),
      },
    );

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();

      return bukuCariResponseFromJson(resp);
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
