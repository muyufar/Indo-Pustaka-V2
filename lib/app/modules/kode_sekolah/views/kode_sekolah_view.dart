import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indopustaka/app/modules/login/login_model.dart';

import '../controllers/kode_sekolah_controller.dart';

// ignore: must_be_immutable
class KodeSekolahView extends GetView<KodeSekolahController> {
  KodeSekolahView({super.key});

  var username = Get.arguments['username'];
  var password = Get.arguments['password'];
  var tagSklh = Get.arguments['tag'];
  var typeDivace = Get.arguments['type_divace'];

  void postLogin(Login login) {
    bool isValidate = controller.formKey.currentState!.validate();
    if (isValidate) {
      controller.formKey.currentState!.save();
      login.username = username;
      login.password = password;
      login.kode = controller.kdSekolahController.text;
      login.tag = "Siswa";
      login.typeDivace = "";

      controller.loginCont.login(login);
    }
  }

  void tampilPesan(String pesan) {
    Get.dialog(
      AlertDialog(
        title: Text('Informasi'),
        content: Text(pesan),
        actions: [
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var login = Login();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.orange[900],
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: controller.formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: 8.0,
                                        ),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "KODE SEKOLAH",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller:
                                            controller.kdSekolahController,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: "Masukan Kode Sekolah",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.orange,
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.numbers,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Container(
                                    width: Get.width,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (controller.kdSekolahController.text
                                            .isBlank!) {
                                          tampilPesan(
                                              "Kode sekolah masih kosong");
                                        } else {
                                          postLogin(login);
                                        }
                                      },
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange[900],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
