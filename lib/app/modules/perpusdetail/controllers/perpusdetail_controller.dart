import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/res_model.dart';
import 'package:indopustaka/app/data/perpusdetail_provider.dart';
import 'package:indopustaka/app/modules/perpus/controllers/perpus_riwayat_controller.dart';

class PerpusdetailController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final PerpusRiwayatController perpusRiwayatController = Get.put(PerpusRiwayatController());

  PerpusdetailProvider provider = Get.put(PerpusdetailProvider());

  final jumlah = 1.obs;
  final stok = 1.obs;

  void tampilPesan(String pesan) {
    Get.dialog(
      AlertDialog(
        title: Text('Informasi'),
        content: Text(pesan),
        actions: [
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void tambahJumlah() {
    if (jumlah.value == stok.value) {
      tampilPesan(
          'Jumlah peminjaman tidak boleh melebihi stok buku yang tersedia.');
    } else {
      jumlah.value = jumlah.value + 1;
    }
  }

  void kurangiJumlah() {
    if (jumlah.value == 1) {
      tampilPesan('Minimal pinjam 1 buku.');
    } else {
      jumlah.value = jumlah.value - 1;
    }
  }

  void pinjamBukuPerpus(
    String idUserFisik,
    String idBukuFisik,
    String idSekolahFisik,
    int jumlahPinjam,
  ) async {
    var res = await provider.pinjamBukuPerpus(
      idUserFisik,
      idBukuFisik,
      idSekolahFisik,
      jumlahPinjam,
    );
    if (res.statusCode == 200) {
      var respon = await res.stream.bytesToString();
      var pesan = resModelFromJson(respon);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(pesan.message.toString()),
          actions: [
            ElevatedButton(
              onPressed: () {
                for (int i = 0; i < 2; i++) {
                  Get.back();
                }

                perpusRiwayatController.update();
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    } else if (res.statusCode == 400) {
      var bad = await res.stream.bytesToString();
      var pesan = resModelFromJson(bad);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(pesan.message.toString()),
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
