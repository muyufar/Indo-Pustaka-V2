import 'package:get/get.dart';

import '../controllers/multimedia_controller.dart';

class MultimediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultimediaController>(
      () => MultimediaController(),
    );
  }
}
