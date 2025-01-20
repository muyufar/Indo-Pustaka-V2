import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AplikasiController extends GetxController {
  final version = "".obs;

  @override
  void onReady() {
    super.onReady();
    appVersion();
  }

  void appVersion() {
    PackageInfo.fromPlatform().then((value) => version.value = value.version);
  }
}
