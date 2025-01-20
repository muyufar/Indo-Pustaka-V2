import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/routes/app_pages.dart';

import '../controllers/ebook_controller.dart';
import 'package:indopustaka/app/data/color_constants.dart';

class EbookView extends GetView<EbookController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var title = Get.parameters['title'];
    var q = Get.parameters['cari'];
    controller.cari.value = q.toString();

    var jenjang = box.read(StringConstant.jenjang);
    controller.jenjang.value = int.parse(jenjang);

    controller.namaKategori.value = '';
    controller.order.value = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? 'Semua Buku',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: ListView(
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
                        controller: controller.cariBukuController,
                        decoration: InputDecoration(
                          hintText: "Cari Buku E-Book",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.grey[900],
                          suffixIcon: IconButton(
                            onPressed: () {
                              var cari = controller.cariBukuController.text;
                              Get.toNamed(Routes.ebook, parameters: {
                                'title': title!,
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
                              color: Colors.grey,
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
                            return 'Masukan buku yang mau dicari';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  child: GetBuilder<EbookController>(
                    builder: (value) {
                      return value.listBuild(
                        context,
                        value.jenjang.value,
                        value.jumlahLimit.value,
                        value.namaKategori.value,
                        value.cari.value,
                        value.order.value,
                      );
                    },
                  ),
                ),
                Obx(
                  () => controller.isEmpty.value
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
