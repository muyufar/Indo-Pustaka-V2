import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/routes/app_pages.dart';

import '../controllers/multidetail_controller.dart';

class MultidetailView extends GetView<MultidetailController> {
  MultidetailView({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var tipe = Get.parameters['tipe'];
    controller.tipe.value = tipe!;

    var jenjang = box.read(StringConstant.jenjang);
    controller.jenjang.value = jenjang;

    var q = Get.parameters['cari'];
    if (q == null) {
      controller.cari.value = '';
    } else {
      controller.cari.value = q;
    }

    controller.offset.value = '0';
    controller.jumlahLimit.value = 10;

    String title = 'Multimedia';

    print("DATA[JENJANG: $jenjang TIPE: $tipe]");

    switch (tipe) {
      case '1':
        title = "Game";
        break;
      case '2':
        title = "Multimedia";
        break;
      case '3':
        title = "Animasi AR";
        break;
      case '4':
        title = "Mewarnai";
        break;
      default:
        title = "Multimedia";
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Color.fromARGB(255, 212, 252, 255),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22.0, 10.0, 26.0, 23.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: controller.formKey,
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        controller: controller.cariController,
                        decoration: InputDecoration(
                          hintText: "Cari $title",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.grey[900],
                          suffixIcon: IconButton(
                            onPressed: () {
                              var cari = controller.cariController.text;

                              Get.offNamed(Routes.multidetail, parameters: {
                                'tipe': tipe.toString(),
                                'cari': cari,
                              });
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConstant.abuIp,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan multimedia yang mau dicari';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  child: GetBuilder<MultidetailController>(
                    builder: (value) {
                      return value.listBuild(
                        context,
                        value.tipe.value,
                        value.jenjang.value,
                        value.offset.value,
                        value.jumlahLimit.value.toString(),
                        value.cari.value,
                      );
                    },
                  ),
                ),
                Obx(
                  () => (controller.isEmpty.value)
                      ? Container()
                      : Container(
                          padding: EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.tambahPage();
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Muat Lebih Banyak"),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
