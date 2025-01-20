import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    controller.appController.appVersion();

    var idAnggota = box.read(StringConstant.idAnggota);
    controller.usernameSiswa.value = idAnggota;

    var kodeSekolah = box.read(StringConstant.kodeSekolah);
    controller.kdSekolah.value = kodeSekolah;

    return Scaffold(
      key: controller.key,
      appBar: AppBar(
        title: Text(
          'Profil Kamus',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 19.0, 0.0, 9.0),
                        child: Obx(
                          () => ClipOval(
                            child: CachedNetworkImage(
                              width: Get.width / 3,
                              height: Get.width / 3,
                              imageUrl: "${controller.gambarProfil}",
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) {
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
                      Obx(
                        () => Text(
                          "${controller.namaSiswa}".toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          padding: EdgeInsets.only(bottom: 32.0),
                          child: Text(
                            "${controller.usernameSiswa}".toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 21.0,
                        top: 9.0,
                        bottom: 4.0,
                      ),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Pengaturan',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.keamanan);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 4.0),
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        'Keamanan & Kata Sandi',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: Text('Informasi'),
                                    content: Text('Under Contruction'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () => Get.back(),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 4.0),
                                      child: Icon(
                                        Icons.language,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        'Bahasa',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.getCustomerService().then(
                                  (value) {
                                    var url =
                                        "https://wa.me/+${value.nomorTelpon}";

                                    if (Platform.isAndroid) {
                                      controller
                                          .launchUrlAndroid(Uri.parse(url));
                                    } else if (Platform.isIOS) {
                                      controller.launchUrlIos(Uri.parse(url));
                                    } else {
                                      launchUrl(Uri.parse(url));
                                    }
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 4.0),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        'Hubungi Kami',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 21.0,
                        top: 24.0,
                        bottom: 4.0,
                      ),
                      child: Text(
                        'Tentang Aplikasi',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 4.0,
                                    bottom: 8.0,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 8.0,
                                      bottom: 4.0,
                                    ),
                                    child: Text(
                                      'Aplikasi Versi',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Obx(
                                    () => Container(
                                      child: Text(
                                        ' ${controller.appController.version} ',
                                        style: TextStyle(
                                          color: ColorConstant.abuIp,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: Text('Informasi'),
                                    content: Text('Under Contruction'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () => Get.back(),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Syarat & Ketentuan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.web,
                                  parameters: {
                                    'title': 'Kebijakan Privasi',
                                    'url': StringConstant.kebijakanPrivasi,
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Kebijakan Privasi',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.deleteAccount(idAnggota);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Hapus Akun',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(21.0, 33.0, 21.0, 30.0),
                  child: Container(
                    width: Get.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.logout();
                      },
                      child: Text(
                        'Keluar'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
