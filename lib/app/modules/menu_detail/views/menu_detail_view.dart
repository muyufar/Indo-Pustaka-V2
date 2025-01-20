import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
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
      backgroundColor: Colors.white70,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: SizedBox(),
        ),
        title: Obx(
          () => AppBarCustom(
            urlImage: profilCont.gambarProfil.value,
            title: 'Selamat Datang!',
            subTitle: profilCont.namaSiswa.value,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.bookmark),
            icon: Icon(
              Iconsax.bookmark_copy,
              color: Colors.black87,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstant.backgroundV2,
        elevation: 3.0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: controller.cariController,
              style: GoogleFonts.varelaRound(),
              decoration: InputDecoration(
                hintText: 'Cari Buku E-Book',
                hintStyle: GoogleFonts.varelaRound(),
                suffixIcon: Icon(Iconsax.search_normal_copy),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onEditingComplete: () {
                var cari = controller.cariController.text;
                Get.toNamed(Routes.ebook, parameters: {
                  'title': 'Cari Buku',
                  'cari': cari,
                });
              },
            ),
          ),
          Container(child: KategoriTag(jenisKategori: 'home')),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: Get.width,
            height: 130,
            child: CarouselSlider(
              items: controller.listCarouselSlider,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 200,
                viewportFraction: 0.75,
                autoPlay: true,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Buku Rekomendasi',
                  style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                Icon(Iconsax.arrow_right_1_copy, size: 20),
              ],
            ),
          ),
          const Gap(5),
          GetBuilder<MenuDetailController>(
            builder: (value) {
              return value.listBuild(
                context,
                value.jenjang.value,
              );
            },
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
    );
  }
}
