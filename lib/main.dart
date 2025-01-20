import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/core/utils/initial_bindings.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/generated/locales.g.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  await Permission.manageExternalStorage.request();
  await Permission.camera.request();
  await Permission.storage.request();

  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: StringConstant.namaAplikasi,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      initialBinding: InitialBinding(),
      initialRoute: AppPages.initial,
      translationsKeys: AppTranslation.translations,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
