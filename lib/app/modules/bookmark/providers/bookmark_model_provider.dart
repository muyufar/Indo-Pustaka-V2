import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/bookmark/bookmark_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';

import '../bookmark_response_model.dart';

class BookmarkModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        return BookmarkResponseModel.fromJson(map);
      }

      if (map is List) {
        return map.map((item) => BookmarkResponseModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl =
        '${StringConstant.webUrl}admin/pustaka/api/Bookmark.php';
  }

  Future<List<BookmarkModel>> getBookmarkModel(
      String idUser, String idSekolah, String jumlahLimit, String cari) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${httpClient.baseUrl}?TAG=bookmark&id_user=$idUser&id_sekolah=$idSekolah&jumlahlimit=$jumlahLimit&q=$cari'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var model = jsonDecode(resp);

      List<BookmarkModel> bookmarkList = model.map<BookmarkModel>((json) {
        return BookmarkModel.fromJson(json);
      }).toList();

      return bookmarkList;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  Future<http.StreamedResponse> tambahBookmark(
      String idUser, String idBuku, String idSekolah) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${httpClient.baseUrl}'));
    request.fields.addAll({
      'TAG': 'tambahBookmark',
      'id_user': idUser,
      'id_buku': idBuku,
      'id_sekolah': idSekolah
    });

    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<http.StreamedResponse> hapusBookmark(
      String idUser, String idBuku, String idSekolah) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${httpClient.baseUrl}'));
    request.fields.addAll({
      'TAG': 'hapusBookmark',
      'id_user': idUser,
      'id_buku': idBuku,
      'id_sekolah': idSekolah
    });

    http.StreamedResponse response = await request.send();

    return response;
  }
}
