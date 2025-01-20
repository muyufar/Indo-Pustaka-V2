import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/perpustakaan/perpustakaan_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class PerpusdetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<PerpustakaanResponse> getPerpusDetail(
    String idBukuFisik,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${httpClient.baseUrl}admin/pustaka/api/MainFisik'),
    );
    request.fields.addAll({
      'TAG': 'semuabuku',
      'id_buku_fisik': idBukuFisik,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = perpustakaanResponseFromJson(resp);

      return model;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  Future<http.StreamedResponse> pinjamBukuPerpus(
    String idUserFisik,
    String idBukuFisik,
    String idSekolahFisik,
    int jumlahPinjam,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${httpClient.baseUrl}admin/pustaka/api/MainFisik'),
    );
    request.fields.addAll({
      'TAG': 'pinjamfisik',
      'id_user_fisik': idUserFisik,
      'id_buku_fisik': idBukuFisik,
      'id_sekolah_fisik': idSekolahFisik,
      'jumlah_pinjam': jumlahPinjam.toString(),
    });
    http.StreamedResponse response = await request.send();

    return response;
  }
}
