import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/string_constants.dart';

import '../controllers/keamanan_controller.dart';

class KeamananView extends GetView<KeamananController> {
  final box = GetStorage();

  KeamananView({super.key});

  void postNewPassword(String idUser, String newPasswd) {
    controller.gantiPass(idUser, newPasswd);
  }

  @override
  Widget build(BuildContext context) {
    var idAnggota = box.read(StringConstant.idAnggota);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ganti Kata Sandi',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Wrap(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "GANTI KATA SANDI",
                              style: TextStyle(
                                color: Colors.orange[900],
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              bottom: 16.0,
                            ),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "KATA SANDI BARU",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => TextFormField(
                                    controller:
                                        controller.passwordOldController,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText:
                                        controller.hideOldPassword.value,
                                    decoration: InputDecoration(
                                      hintText: "Masukan kata sandi baru",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),
                                      suffixIcon: IconButton(
                                        padding: EdgeInsets.only(right: 8.0),
                                        icon: controller.hideOldPassword.value
                                            ? Icon(
                                                Icons.visibility,
                                                color: Colors.grey,
                                              )
                                            : Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                        onPressed: () {
                                          controller.hideOldPassword.value =
                                              !controller.hideOldPassword.value;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              bottom: 16.0,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "KATA SANDI KONFIRMASI",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => TextFormField(
                                    controller:
                                        controller.passwordNewController,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText:
                                        controller.hideNewPassword.value,
                                    decoration: InputDecoration(
                                      hintText: "Masukan kata sandi konfirmasi",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),
                                      suffixIcon: IconButton(
                                        padding: EdgeInsets.only(right: 8.0),
                                        icon: controller.hideNewPassword.value
                                            ? Icon(
                                                Icons.visibility,
                                                color: Colors.grey,
                                              )
                                            : Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                        onPressed: () {
                                          controller.hideNewPassword.value =
                                              !controller.hideNewPassword.value;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                            child: Container(
                              width: Get.width,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (controller.passwordOldController.text
                                      .trim()
                                      .isEmpty) {
                                    tampilPesan(
                                        "Kata Sandi baru masih kosong. Harap isi terlebih dahulu!");
                                  } else if (controller
                                      .passwordNewController.text
                                      .trim()
                                      .isEmpty) {
                                    tampilPesan(
                                        "Konfirmasi Kata Sandi masih kosong. Harap isis terlebih dahulu!");
                                  } else if (controller
                                          .passwordOldController.text
                                          .trim() !=
                                      controller.passwordNewController.text
                                          .trim()) {
                                    tampilPesan(
                                        "Kata Sandi Konfirmasi dan Kata Sandi Baru tidak sama. Harap cek kembali Kata Sandi.");
                                  } else {
                                    postNewPassword(idAnggota,
                                        controller.passwordNewController.text);
                                  }
                                },
                                child: Text(
                                  'GANTI KATA SANDI',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
}
