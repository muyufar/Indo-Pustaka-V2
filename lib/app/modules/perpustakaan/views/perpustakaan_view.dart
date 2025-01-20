import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/modules/perpus/controllers/perpus_riwayat_controller.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/app_bar_custom.dart';
import 'package:indopustaka/app/widget/kategori_tag.dart';

import '../controllers/perpustakaan_controller.dart';

// ignore: must_be_immutable
class PerpustakaanView extends GetView<PerpustakaanController> {
  PerpustakaanView({super.key});

  PerpusRiwayatController perpusRiwayatController =
      Get.put(PerpusRiwayatController());

  var box = GetStorage();

  Widget clipOval() {
    return ClipOval(
      clipBehavior: Clip.antiAlias,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0), //width of the border
          child: ClipOval(
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: 32.0, // this width forces the container to be a circle
              height: 32.0, // this height forces the container to be a circle
              child: Text(
                "12",
                style: TextStyle(
                  fontSize: 200.0,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow.shade600,
              Colors.orange,
              Colors.red,
            ],
          ),
          border: Border.all(
            color: Colors.amber, //kHintColor, so this should be changed?
          ),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var idSekolah = box.read(StringConstant.kodeSekolah);

    var idAnggota = box.read(StringConstant.idAnggota);
    perpusRiwayatController.idUserFisik.value = idAnggota;

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => AppBarCustom(
            urlImage: controller.profilCont.gambarProfil.value,
            title: 'Hai Kamu,',
            subTitle: controller.profilCont.namaSiswa.value,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: IconThemeData(color: ColorConstant.abuIp),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: false,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(23.0, 16.0, 8.0, 20.0),
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

                        Get.toNamed(Routes.perpus, parameters: {
                          'title': 'Cari Buku',
                          'cari': cari,
                        });
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
              Container(
                child: KategoriTag(
                  jenisKategori: 'perpus',
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(23.0, 8.0, 20.0, 8.0),
                width: Get.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                        child: Text(
                          'Buku Perpustakaan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: AspectRatio(
                          aspectRatio: 2 / 1,
                          child: controller.listBuild(
                            context,
                            idSekolah,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(23.0, 32.0, 20.0, 8.0),
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Riwayat Peminjaman',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: GetBuilder<PerpusRiwayatController>(
                          builder: (value) {
                            return value.listBuild(
                              context,
                              value.idUserFisik.value,
                              value.jumlahLimit.value,
                            );
                          },
                        ),
                      ),
                      Obx(
                        () => perpusRiwayatController.isEmpty.value
                            ? Container()
                            : Container(
                                padding: EdgeInsets.all(16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    perpusRiwayatController.tambahPage();
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
