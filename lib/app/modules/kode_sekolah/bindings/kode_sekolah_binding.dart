import 'package:get/get.dart';

import '../controllers/kode_sekolah_controller.dart';

class KodeSekolahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KodeSekolahController>(
      () => KodeSekolahController(),
    );
  }
}
