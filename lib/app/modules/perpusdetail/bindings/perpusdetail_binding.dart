import 'package:get/get.dart';

import '../controllers/perpusdetail_controller.dart';

class PerpusdetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerpusdetailController>(
      () => PerpusdetailController(),
    );
  }
}
