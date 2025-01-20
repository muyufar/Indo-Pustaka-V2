import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:indopustaka/app/modules/login/login_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final box = GetStorage();

  void postLogin(Login login) {
    bool isValidate = controller.formKey.currentState!.validate();
    if (isValidate) {
      controller.formKey.currentState!.save();
      login.username = controller.usernameController.text;
      login.password = controller.passwordController.text;
      login.kode = '0798';
      login.tag = 'Siswa';
      login.typeDivace = "";

      // Get.offNamed(Routes.kodeSekolah, arguments: {
      //   'username': login.username,
      //   'password': login.password,
      //   'tag': login.tag,
      //   'type_divace': login.typeDivace,
      // });
      controller.login(login);
    }
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

  @override
  Widget build(BuildContext context) {
    var login = Login();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.orange[900],
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: controller.formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: 8.0,
                                        ),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "ID ANGGOTA",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller:
                                            controller.usernameController,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        keyboardType: TextInputType.text,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "Masukan ID Anggota",
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
                                            Icons.person,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: 8.0,
                                        ),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "KATA SANDI",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => TextFormField(
                                          obscureText:
                                              controller.hidePassword.value,
                                          controller:
                                              controller.passwordController,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                            hintText: "Masukan Kata Sandi",
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
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              icon:
                                                  controller.hidePassword.value
                                                      ? Icon(
                                                          Icons.visibility,
                                                          color: Colors.grey,
                                                        )
                                                      : Icon(
                                                          Icons.visibility_off,
                                                          color: Colors.grey,
                                                        ),
                                              onPressed: () {
                                                controller.hidePassword.value =
                                                    !controller
                                                        .hidePassword.value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    16.0,
                                    16.0,
                                    16.0,
                                    16.0,
                                  ),
                                  child: Container(
                                    width: Get.width,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (controller
                                            .usernameController.text.isBlank!) {
                                          tampilPesan(
                                              "Nama pengguna masih kosong");
                                        } else if (controller
                                            .passwordController.text.isBlank!) {
                                          tampilPesan(
                                              "Kata Sandi masih kosong");
                                        } else {
                                          postLogin(login);
                                        }
                                      },
                                      child: Text(
                                        'LANJUT',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange[900],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Belum punya akun?",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.profilCont
                                              .getCustomerService()
                                              .then(
                                            (value) async {
                                              var url =
                                                  "https://wa.me/+${value.nomorTelpon}";

                                              if (Platform.isAndroid) {
                                                await launchUrl(Uri.parse(url),
                                                    mode: LaunchMode
                                                        .externalApplication);
                                              } else if (Platform.isIOS) {
                                                await launchUrl(Uri.parse(url),
                                                    mode: LaunchMode
                                                        .externalNonBrowserApplication);
                                              } else {
                                                await launchUrl(Uri.parse(url));
                                              }
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Hubungi",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
}
