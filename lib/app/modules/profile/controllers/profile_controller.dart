import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/controllers/aplikasi_controller.dart';
import 'package:indopustaka/app/data/models/customer_service/cust_service_resp.dart';
import 'package:indopustaka/app/data/models/resp_model.dart';
import 'package:indopustaka/app/modules/profile/profile_model.dart';
import 'package:indopustaka/app/modules/profile/providers/profile_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  ProfileProvider profileProvider = Get.put(ProfileProvider());
  AplikasiController appController = Get.find();

  final usernameSiswa = ''.obs;
  final namaSiswa = ''.obs;
  final kdSekolah = ''.obs;
  final namaSekolah = ''.obs;
  final teleponSiswa = ''.obs;
  final gambarProfil = ''.obs;

  final isLoading = false.obs;

  var isReady = false;
  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    isReady = true;

    var idUser = box.read(StringConstant.idAnggota);
    getProfile(idUser.toString());
  }

  void logout() {
    if (isReady) {
      box.erase();
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> launchUrlAndroid(Uri url) async {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> launchUrlIos(Uri url) async {
    await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }

  Future<void> launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  Future<CustomerServiceResponse> getCustomerService() async {
    var res = await profileProvider.getCustomerService();

    return res;
  }

  void getProfile(String idUser) async {
    var res = await profileProvider.getProfile(idUser);

    if (res.statusCode == 200) {
      final model = Profile.fromJson(jsonDecode(res.bodyString!));

      usernameSiswa.value = model.usernameSiswa!;
      namaSiswa.value = model.namaSiswa!;
      kdSekolah.value = model.kdSekolah!;
      namaSekolah.value = model.namaSekolah!;
      teleponSiswa.value = model.teleponSiswa!;
      gambarProfil.value = model.gambarProfil!;
    }
  }

  void deleteAkun(String idUser) async {
    EasyLoading.show();
    isLoading.value = true;

    var res = await profileProvider.hapusAkun(idUser);

    if (res.statusCode == 200) {
      EasyLoading.dismiss();
      isLoading.value = false;

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text('Akun berhasil dihapus!'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else if (res.statusCode == 400) {
      EasyLoading.dismiss();
      isLoading.value = false;

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
      EasyLoading.dismiss();
      isLoading.value = false;

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

  void tampilPesan() {
    Get.dialog(
      AlertDialog(
        title: Text("Informasi"),
        content: Text("Terdapat kesalahan saat mengambil profil"),
        actions: [
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void deleteAccount(String idUser) {
    Get.dialog(
      AlertDialog(
        title: Text('Informasi'),
        content: Text('Anda yakin mau menghapus akun?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              deleteAkun(idUser);
              Get.back();
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
  }
}
