import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/routes/app_pages.dart';

import '../controllers/perpus_controller.dart';

// ignore: must_be_immutable
class PerpusView extends GetView<PerpusController> {
  PerpusView({super.key});

  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var idSekolah = box.read(StringConstant.kodeSekolah);
    controller.idSekolah.value = idSekolah;

    var title = Get.parameters['title'];

    var q = Get.parameters['cari'];
    controller.cari.value = q.toString();

    controller.namaKategori.value = '';
    controller.order.value = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? 'Semua Kategori',
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
        shrinkWrap: true,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(23.0, 16.0, 8.0, 20.0),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.formKey,
                    child: TextFormField(
                      obscureText: false,
                      controller: controller.cariController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: "Pencarian Buku",
                        focusColor: Colors.white,
                        fillColor: Colors.grey[900],
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            var cari = controller.cariController.text;
                            Get.toNamed(
                              Routes.perpus,
                              parameters: {
                                'title': title!,
                                'cari': cari,
                              },
                            );
                          },
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
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.orange,
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
                Container(
                  child: GetBuilder<PerpusController>(
                    builder: (value) {
                      return value.listBuild(
                        context,
                        value.idSekolah.value,
                        value.namaKategori.value,
                        value.jumlahLimit.value,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
