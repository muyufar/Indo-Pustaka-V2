import 'package:get/get.dart';

import '../models/buku_detail_model_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class BukuDetailModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return BukuDetailModel.fromJson(map);
      if (map is List) {
        return map.map((item) => BukuDetailModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${StringConstant.webUrl}pustaka/api/';
  }

  Future<BukuDetailModel?> getBukuDetailModel(
      String idBuku, String jenjang, String idSekolah, String idUser) async {
    final response = await get(
        'MainHome?TAG=bukudetail&jenjang=$jenjang&id_buku=$idBuku&id_sekolah=$idSekolah&id_user=$idUser');
    return response.body;
  }

  Future<Response<BukuDetailModel>> postBukuDetailModel(
          BukuDetailModel bukudetailmodel) async =>
      await post('bukudetailmodel', bukudetailmodel);
  Future<Response> deleteBukuDetailModel(int id) async =>
      await delete('bukudetailmodel/$id');
}
