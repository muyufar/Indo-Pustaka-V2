import 'package:get/get.dart';

import '../controllers/perpus_controller.dart';

class PerpusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerpusController>(
      () => PerpusController(),
    );
  }
}
