import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/modules/profile/controllers/profile_controller.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/app_bar_custom.dart';
import 'package:indopustaka/app/widget/book_menu.dart';

import 'package:indopustaka/app/widget/kategori_tag.dart';

import '../controllers/menu_detail_controller.dart';
import 'package:indopustaka/app/data/color_constants.dart';

// ignore: must_be_immutable
class MenuDetailView extends GetView<MenuDetailController> {
  ProfileController profilCont = Get.put(ProfileController());

  var box = GetStorage();

  MenuDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var jenjang = box.read(StringConstant.jenjang);
    controller.jenjang.value = int.parse(jenjang);

    return Scaffold(
      key: controller.key,
      backgroundColor: Color(0xFF16142C),
      appBar: AppBar(
        title: Obx(
          () => AppBarCustom(
            urlImage: profilCont.gambarProfil.value,
            title: 'Hai Kamu',
            subTitle: profilCont.namaSiswa.value,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.bookmark);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Icon(
                Icons.bookmark,
                size: 34.0,
                color: Colors.orange,
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF16142C),
        elevation: 0.0,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: ListView(
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(22.0, 10.0, 26.0, 23.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        obscureText: false,
                        controller: controller.cariController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Cari Buku E-Book",
                          fillColor: Colors.grey[900],
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              var cari = controller.cariController.text;
                              Get.toNamed(
                                Routes.ebook,
                                parameters: {
                                  'title': 'Cari Buku',
                                  'cari': cari,
                                },
                              );
                            },
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
                              Radius.circular(10.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
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
                    child: KategoriTag(
                      jenisKategori: 'home',
                    ),
                  ),
                  Container(
                    height: Get.width / 2 + 15,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(21.0, 8.0, 0.0, 8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.detail);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: BookMenu(
                                judul: 'Buku Saya',
                                deskripsi:
                                    'Di dalam sini terdapat file ebook yang sudah kamu pinjam lho. Baca lebih banyak ya? Ingat buku adalah gudang ilmu.',
                                warna: ColorConstant.kuningIp,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                Routes.ebook,
                                parameters: {
                                  "title": "Pinjam E-Buku",
                                  "cari": "",
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: BookMenu(
                                judul: 'Pinjam E-book',
                                deskripsi:
                                    'Di dalam sini terdapat file ebook yang bisa kamu pinjam secara gratis lho. Baca buku digital lebih simpel dan lebih mudah di dalam aplikasi.',
                                warna: ColorConstant.hijau,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.hetBuku);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: BookMenu(
                                judul: 'Buku HET',
                                deskripsi:
                                    'Di dalam sini terdapat file ebook yang bisa kamu pinjam secara gratis dan untuk menunjang pembelajaranmu lho.',
                                warna: ColorConstant.merah,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(22.0, 0.0, 0.0, 0.0),
                      child: Container(
                        child: Text(
                          'Buku Rekomendasi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: GetBuilder<MenuDetailController>(
                      builder: (value) {
                        return value.listBuild(
                          context,
                          value.jenjang.value,
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
      ),
    );
  }
}
