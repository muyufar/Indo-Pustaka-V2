import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/models/auth/login/login_response_model.dart';
import 'package:indopustaka/app/data/models/resp_model.dart';
import 'package:indopustaka/app/data/models/siswa/siswa_resp_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/modules/login/login_model.dart';

import 'package:indopustaka/app/modules/login/providers/login_provider.dart';
import 'package:indopustaka/app/modules/profile/controllers/profile_controller.dart';
import 'package:indopustaka/app/routes/app_pages.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginProvider loginProvider = Get.put(LoginProvider());
  ProfileController profilCont = Get.put(ProfileController());

  final hidePassword = true.obs;
  final isLoading = false.obs;

  var formKey = GlobalKey<FormState>();
  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    var isLogin = box.read('is_login');
    if (isLogin != null && isLogin) {
      Get.offNamed(Routes.home);
    }
  }

  void siswa(String idAnggota) async {
    var res = await loginProvider.siswa(idAnggota);
    if (res.statusCode == 200) {
      EasyLoading.dismiss();
      isLoading.value = false;

      var resp = await res.stream.bytesToString();
      var model = jsonDecode(resp);

      List<SiswaResponse> bookmarkList = model.map<SiswaResponse>((json) {
        return SiswaResponse.fromJson(json);
      }).toList();

      box
          .write(
            StringConstant.layanan,
            bookmarkList[0].layanan,
          )
          .then(
            (value) => Get.offAllNamed(Routes.home),
          );
    }
  }

  void login(Login login) async {
    EasyLoading.show();
    isLoading.value = true;

    var res = await loginProvider.login(login);

    if (res.statusCode == 200) {
      var resp = await res.stream.bytesToString();
      final model = loginResponseFromJson(resp);

      box.write(StringConstant.kodeSekolah, model.kdSekolah);
      box.write(StringConstant.jenjang, model.jenjang);
      box.write(StringConstant.jabatan, model.jabatan);
      box.write(StringConstant.isLogin, true);
      box
          .write(
        StringConstant.idAnggota,
        model.idAnggota,
      )
          .then(
        (value) {
          siswa(model.idAnggota.toString());
        },
      );

      print("DATA[JENJANG: ${model.jenjang}]");
    } else if (res.statusCode == 400) {
      EasyLoading.dismiss();
      isLoading.value = false;

      var bad = await res.stream.bytesToString();
      var pesan = responseModelFromJson(bad);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(pesan.pesan!),
          actions: [
            ElevatedButton(
              onPressed: () => Get.offNamed(Routes.login),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      EasyLoading.dismiss();
      isLoading.value = false;

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(
              'Periksa kembali user dan password, \natau cek kembali jaringan yang digunakan.'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.offNamed(Routes.login),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
