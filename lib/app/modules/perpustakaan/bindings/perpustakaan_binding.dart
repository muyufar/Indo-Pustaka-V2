import 'package:get/get.dart';

import '../controllers/perpustakaan_controller.dart';

class PerpustakaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerpustakaanController>(
      () => PerpustakaanController(),
    );
  }
}
