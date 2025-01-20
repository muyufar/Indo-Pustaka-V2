import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indopustaka/app/controllers/aplikasi_controller.dart';
import 'package:indopustaka/app/data/string_constants.dart';

import 'package:indopustaka/gen/assets.gen.dart';

import '../controllers/splash_controller.dart';

// ignore: must_be_immutable
class SplashView extends GetView<SplashController> {
  AplikasiController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.changeScreen();

    return Scaffold(
      backgroundColor: Color(0xFF16142C),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Image.asset(
              Assets.images.logo.path,
              height: Get.width / 3,
              width: Get.width / 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstant.namaAplikasi,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                StringConstant.ags,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Obx(
                    () => Text(
                      'Versi Aplikasi ${appController.version}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
