import 'package:get/get.dart';

import '../controllers/buku_detail_controller.dart';

class BukuDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BukuDetailController>(
      () => BukuDetailController(),
    );
  }
}
