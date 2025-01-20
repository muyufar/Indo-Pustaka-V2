import 'package:get/get.dart';

import '../controllers/pengudetail_controller.dart';

class PengudetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengudetailController>(
      () => PengudetailController(),
    );
  }
}
