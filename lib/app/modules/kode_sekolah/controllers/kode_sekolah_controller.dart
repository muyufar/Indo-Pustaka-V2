import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/modules/login/controllers/login_controller.dart';

class KodeSekolahController extends GetxController {
  TextEditingController kdSekolahController = TextEditingController();

  LoginController loginCont = Get.put(LoginController());

  var formKey = GlobalKey<FormState>();
}
