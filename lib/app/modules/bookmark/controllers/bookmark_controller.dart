import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/models/bookmark/bookmark_model.dart';
import 'package:indopustaka/app/data/models/resp_model.dart';
import 'package:indopustaka/app/modules/bookmark/providers/bookmark_model_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookmarkController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<SfPdfViewerState> pdfState = GlobalKey();
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final box = GetStorage();

  TextEditingController cariBukuController = TextEditingController();

  BookmarkModelProvider provider = Get.put(BookmarkModelProvider());

  final isEmpty = false.obs;
  final idUser = ''.obs;
  final idSekolah = ''.obs;
  final jumlahLimit = 0.obs;
  final cari = ''.obs;

  var bookmarkList = <BookmarkModel>[].obs;

  void tambahPage() async {
    jumlahLimit.value = jumlahLimit.value + 10;
    List<BookmarkModel> data = await provider.getBookmarkModel(
      idUser.value,
      idSekolah.value,
      jumlahLimit.value.toString(),
      cari.value,
    );

    if (data.isEmpty) {
      isEmpty.value = true;
    } else {
      bookmarkList.addAll(data);
    }

    log('JUMLAHLIMIT: ${jumlahLimit.value} \n ISEMPTY: ${isEmpty.value}');

    update();
  }

  void tambahBookmark(String idUser, String idBuku, String idSekolah) async {
    var res = await provider.tambahBookmark(idUser, idBuku, idSekolah);

    if (res.statusCode == 200) {
      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(
              'Berhasil menambahkan bookmark. Apakah anda ingin membuka bookmark?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.offNamed(Routes.bookmark);
              },
              child: Text('Ya'),
            ),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Tidak'),
            ),
          ],
        ),
      );
    } else if (res.statusCode == 400) {
      var bad = await res.stream.bytesToString();
      var model = jsonDecode(bad);
      var pesan = responseModelFromJson(model);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(pesan.pesan.toString()),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text('Terjadi kesalahan. Coba lagi nanti'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void hapusBookmark(String idUser, String idBuku, String idSekolah) async {
    var res = await provider.hapusBookmark(idUser, idBuku, idSekolah);

    if (res.statusCode == 200) {
      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(
              'Berhasil hapus bookmark. Buku akan dihapus dari daftar bookmark anda.'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else if (res.statusCode == 400) {
      var bad = await res.stream.bytesToString();
      var model = jsonDecode(bad);
      var pesan = responseModelFromJson(model);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(pesan.pesan!),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text('Terjadi kesalahan. Coba lagi nanti'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<List<BookmarkModel>> getBookmark(
    String idUser,
    String idSekolah,
    String jumlahLimit,
    String cari,
  ) async {
    var res =
        await provider.getBookmarkModel(idUser, idSekolah, jumlahLimit, cari);

    return res;
  }

  Widget listBuild(
    BuildContext context,
    String idUser,
    String idSekolah,
  ) {
    return FutureBuilder<List<BookmarkModel>>(
      future: provider.getBookmarkModel(
          idUser, idSekolah, jumlahLimit.value.toString(), cari.value),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookmarkModel> data = snapshot.data!;
          bookmarkList.addAll(data);

          return Container(
            child: _listView(bookmarkList),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Container(
              child: NoDataView(
                pesan: "Tidak ada data yang ditampilkan.",
              ),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _listView(List<BookmarkModel> data) {
    if (data.isEmpty) {
      return NoDataView(
        pesan: "Tidak ada data yang ditampilkan.",
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tileView(data, index);
        },
      );
    }
  }

  Widget _tileView(List<BookmarkModel> data, int index) {
    return InkWell(
      onTap: () {
        var param = {"id_buku": "${data[index].idBuku}"};

        Get.toNamed(Routes.bukuDetail, parameters: param);
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Get.width / 3,
              height: (Get.width / 3) + 35,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.grey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: CachedNetworkImage(
                    width: 50,
                    height: 100,
                    fit: BoxFit.fill,
                    imageUrl: data[index].cover!,
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Icon(Icons.error);
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width / 3,
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                data[index].judul!,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
