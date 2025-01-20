import 'package:get/get.dart';

import 'package:indopustaka/app/routes/app_pages.dart';

class SplashController extends GetxController {
  void changeScreen() {
    Future.delayed(
      Duration(
        seconds: 5,
      ),
      () {
        Get.offNamed(Routes.login);
      },
    );
  }
}
