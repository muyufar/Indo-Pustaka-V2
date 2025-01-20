import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/resp_model.dart';
import 'package:indopustaka/app/data/peminjaman_provider.dart';

class PeminjamanController extends GetxController {
  PeminjamanProvider provider = Get.put(PeminjamanProvider());

  void pinjam(
      String idBuku, String idUser, String idSekolah, String jenjang) async {
    var res = await provider.tambahPinjaman(idBuku, idUser, idSekolah, jenjang);

    if (res.statusCode == 200) {
      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text('Berhasil meminjam buku.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    } else if (res.statusCode == 400) {
      var bad = await res.stream.bytesToString();
      var pesan = responseModelFromJson(bad);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(pesan.pesan.toString()),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Ok'),
            )
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
}
