import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/resp_model.dart';
import 'package:indopustaka/app/modules/keamanan/providers/keamanan_provider.dart';

class KeamananController extends GetxController {
  KeamananProvider provider = Get.put(KeamananProvider());

  TextEditingController passwordOldController = TextEditingController();
  TextEditingController passwordNewController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final hideOldPassword = true.obs;
  final hideNewPassword = true.obs;

  void gantiPass(String idUser, String newPasswd) async {
    var res = await provider.gantiPasswd(idUser, newPasswd);

    if (res.statusCode == 200) {
      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text("Kata Sandi berhasil diganti"),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text("OK"),
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
