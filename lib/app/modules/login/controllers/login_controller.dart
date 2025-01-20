import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:indopustaka/app/data/models/auth/login/login_response_model.dart';
import 'package:indopustaka/app/data/models/resp_model.dart';
import 'package:indopustaka/app/data/models/siswa/siswa_resp_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/modules/login/login_model.dart';

import 'package:indopustaka/app/modules/login/providers/login_provider.dart';
import 'package:indopustaka/app/modules/profile/controllers/profile_controller.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

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
          titleTextStyle: GoogleFonts.varelaRound(
            color: HexColor('333333'),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          contentTextStyle: GoogleFonts.varelaRound(
            color: HexColor('333333'),
            fontSize: 14,
          ),
          title: Text('Informasi'),
          content: Text(pesan.pesan!),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
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
          titleTextStyle: GoogleFonts.varelaRound(
            color: HexColor('333333'),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          contentTextStyle: GoogleFonts.varelaRound(
            color: HexColor('333333'),
            fontSize: 14,
          ),
          content: Text('Cek kembali jaringan yang digunakan.'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text(
                'OK',
                style: GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void btnHubungi() async {
    profilCont.getCustomerService().then(
      (value) async {
        var url = "https://wa.me/+${value.nomorTelpon}";

        if (Platform.isAndroid) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        } else if (Platform.isIOS) {
          await launchUrl(Uri.parse(url),
              mode: LaunchMode.externalNonBrowserApplication);
        } else {
          await launchUrl(Uri.parse(url));
        }
      },
    );
  }
}
