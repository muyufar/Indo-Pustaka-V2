import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/mainhome/buku/detail/bukudetail_model.dart';
import 'package:indopustaka/app/data/models/mainhome/buku/detail/bukudetail_resp_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class BukuDetailProvider extends GetConnect implements GetxService {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return BukuDetailModel.fromJson(map);
      }
      if (map is List) {
        return map.map((item) => BukuDetailModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${StringConstant.webUrl}admin/pustaka/api/MainHome';
  }

  Future<BukuDetailResponse> getBukuDetail(BukuDetailModel bukuDetail) async {
    var request = http.MultipartRequest('POST', Uri.parse(httpClient.baseUrl!));
    request.fields.addAll({
      'TAG': 'bukudetail',
      'jenjang': bukuDetail.jenjang.toString(),
      'id_buku': bukuDetail.idBuku!,
      'id_sekolah': bukuDetail.idSekolah!,
      'id_user': bukuDetail.idUser!
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = bukuDetailResponseFromJson(resp);

      return model;
    } else {
      throw Exception("Gagal mengambil buku detail");
    }
  }
}
