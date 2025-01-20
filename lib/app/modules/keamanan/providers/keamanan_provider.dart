import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indopustaka/app/data/string_constants.dart';

class KeamananProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = StringConstant.webUrl;
  }

  Future<http.StreamedResponse> gantiPasswd(
      String username, String passwd) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${httpClient.baseUrl}admin/api/ubah_password.php'));
    request.fields.addAll({
      'username': username,
      'newPass': passwd,
    });

    http.StreamedResponse response = await request.send();

    return response;
  }
}
