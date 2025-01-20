import 'package:get/get.dart';

import '../controllers/multidetweb_controller.dart';

class MultidetwebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultidetwebController>(
      () => MultidetwebController(),
    );
  }
}
