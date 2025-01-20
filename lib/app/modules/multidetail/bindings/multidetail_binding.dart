import 'package:get/get.dart';

import '../controllers/multidetail_controller.dart';

class MultidetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultidetailController>(
      () => MultidetailController(),
    );
  }
}
