import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/models/customer_service/cust_service_resp.dart';

import '../profile_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

class ProfileProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Profile.fromJson(map);
      if (map is List) {
        return map.map((item) => Profile.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${StringConstant.webUrl}admin/api/';
  }

  Future<Response> getProfile(String idUser) async {
    final response = await get('profil.php?id_user=$idUser');

    return response;
  }

  Future<CustomerServiceResponse> getCustomerService() async {
    var request = http.Request(
        'GET', Uri.parse('${httpClient.baseUrl}/customer_service.php'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = customerServiceResponseFromJson(resp);

      return model;
    } else {
      throw Exception("Gagal mengambil customer service");
    }
  }

  Future<http.StreamedResponse> hapusAkun(String idUser) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${StringConstant.webUrl}admin/pustaka/api/deleteAkun'),
    );

    request.fields.addAll({
      'id_login': idUser,
    });

    http.StreamedResponse response = await request.send();

    return response;
  }
}
