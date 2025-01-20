import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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
      backgroundColor: HexColor('FDF6E3'),
      body: Center(
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang!",
                        style: GoogleFonts.jost(
                          color: HexColor('333333'),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Silahkan login untuk melanjutkan membaca buku",
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                      const Gap(15),
                      loginForm(login),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form loginForm(Login login) {
    return Form(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.usernameController,
            style: GoogleFonts.jost(
              fontSize: 14,
              color: Colors.black87,
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: const Text('ID Anggota'),
              prefixIcon: const Icon(Iconsax.user_copy),
              errorStyle: GoogleFonts.jost(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "ID Anggota masih kosong";
              } else {
                return null;
              }
            },
          ),
          const Gap(17),
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              style: GoogleFonts.jost(
                color: Colors.black87,
                fontSize: 14,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                label: const Text('Kata Sandi'),
                prefixIcon: const Icon(
                  Iconsax.lock_1_copy,
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.toggle(),
                  icon: Icon(
                    (controller.hidePassword.value)
                        ? Iconsax.eye_copy
                        : Iconsax.eye_slash_copy,
                  ),
                ),
                errorStyle: GoogleFonts.jost(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: controller.hidePassword.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Kata Sandi masih kosong";
                } else if (value.isNotEmpty && value.length < 3) {
                  return "Kata Sandi minimal 8 karakter";
                } else {
                  return null;
                }
              },
            ),
          ),
          const Gap(20),
          SizedBox(
            width: Get.width,
            height: 46,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor('FF8C42'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (controller.formKey.currentState!.validate()) {
                  postLogin(login);
                }
              },
              child: Text(
                'Masuk',
                style: GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum memiliki akun?',
                style: GoogleFonts.jost(
                  fontSize: 14.0,
                ),
              ),
              TextButton(
                onPressed: controller.btnHubungi,
                child: Text(
                  'Hubungi',
                  style: GoogleFonts.jost(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
