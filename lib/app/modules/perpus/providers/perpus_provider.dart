import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/perpustakaan/perpustakaan_model.dart';
import 'package:indopustaka/app/data/models/riwayatperpus/riwayat_perpus_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class PerpusProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return RiwayatPerpusResponse.fromJson(map);
      }

      if (map is List) {
        return map
            .map(
              (e) => RiwayatPerpus.fromJson(e),
            )
            .toList();
      }
    };
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<PerpustakaanResponse> getAllPerpus(
    int jumlahLimit,
    String idSekolah,
    String cari,
    String namaKategori,
    int order,
  ) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${httpClient.baseUrl}admin/pustaka/api/MainFisik'));
    request.fields.addAll({
      'TAG': 'semuabuku',
      'jumlahlimit': jumlahLimit.toString(),
      'id_sekolah': idSekolah,
      'cari': cari,
      'nama_kategori': namaKategori,
      'order': order.toString(),
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

  Future<RiwayatPerpusResponse> getRiwayatPerpus(
    String idUserFisik,
    int jumlahLimit,
  ) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${httpClient.baseUrl}admin/pustaka/api/MainFisik'));
    request.fields.addAll({
      'TAG': 'riwayatpeminjaman',
      'id_user_fisik': idUserFisik,
      'jumlahlimit': jumlahLimit.toString(),
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = riwayatPerpusResponseFromJson(resp);

      return model;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  Future<http.StreamedResponse> batalkanPeminjaman(
      String idPeminjamanFisik) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${httpClient.baseUrl}admin/pustaka/api/MainFisik'));
    request.fields.addAll({
      'TAG': 'batalpinjamfisik',
      'id_peminjaman_fisik': idPeminjamanFisik,
    });

    http.StreamedResponse response = await request.send();

    return response;
  }
}
