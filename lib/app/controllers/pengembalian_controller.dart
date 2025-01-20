import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/resp_model.dart';
import 'package:indopustaka/app/data/pengembalian_provider.dart';

class PengembalianController extends GetxController {
  PengembalianProvider provider = Get.put(PengembalianProvider());

  void kembalikan(String idBuku, String idUser, String idSekolah) async {
    var res = await provider.kembalikanPinjaman(idBuku, idUser, idSekolah);

    if (res.statusCode == 200) {
      var resp = await res.stream.bytesToString();
      var model = responseModelFromJson(resp);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(model.pesan.toString()),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text("Ok"),
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
