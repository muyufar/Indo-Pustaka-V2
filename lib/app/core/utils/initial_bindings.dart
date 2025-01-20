import 'package:get/get.dart';
import 'package:indopustaka/app/controllers/aplikasi_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AplikasiController());
  }
}
