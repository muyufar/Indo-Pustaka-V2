import 'package:get/get.dart';

import '../controllers/het_buku_controller.dart';

class HetBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HetBukuController>(
      () => HetBukuController(),
    );
  }
}
