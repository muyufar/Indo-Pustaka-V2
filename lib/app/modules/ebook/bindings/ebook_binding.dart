import 'package:get/get.dart';

import '../controllers/ebook_controller.dart';

class EbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookController>(
      () => EbookController(),
    );
  }
}
