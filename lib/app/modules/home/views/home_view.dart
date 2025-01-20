import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:indopustaka/app/data/color_constants.dart';

import 'package:indopustaka/app/data/models/menu/menu_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/gen/assets.gen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var menu = MenuModel();
    menu.layanan = int.parse(box.read(StringConstant.layanan));
    menu.jabatan = int.parse(box.read(StringConstant.jabatan));

    return Scaffold(
      key: controller.key,
      appBar: ipAppBar(),
      backgroundColor: ColorConstant.whiteA700,
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu Utama',
                  style: GoogleFonts.jost(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.textBlackV2,
                  ),
                ),
                const Gap(10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: GetBuilder<HomeController>(
                    builder: (value) {
                      return value.listBuild(context, menu);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // body: Stack(
      //   children: [
      //     SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           Container(
      //             padding: EdgeInsets.all(8.0),
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(15.0),
      //               child: AspectRatio(
      //                 aspectRatio: 4 / 2,
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                       fit: BoxFit.fill,
      //                       image: AssetImage(Assets.images.banner.path),
      //                     ),
      //                   ),
      //                   child: Column(),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Container(
      //               padding: EdgeInsets.all(8.0),
      //               decoration: BoxDecoration(
      //                 color: Colors.grey[900],
      //                 borderRadius: BorderRadius.circular(10.0),
      //               ),
      //               child: Column(
      //                 children: [
      //                   Container(
      //                     alignment: Alignment.topLeft,
      //                     child: Text(
      //                       "Fitur",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 24.0,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                   Container(
      //                     height: Get.height / 2,
      //                     alignment: Alignment.centerLeft,
      //                     child: GetBuilder<HomeController>(
      //                       builder: (value) {
      //                         return value.listBuild(context, menu);
      //                       },
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  AppBar ipAppBar() {
    return AppBar(
      backgroundColor: ColorConstant.backgroundV2,
      automaticallyImplyLeading: false,
      title: Text(
        StringConstant.namaAplikasi,
        style: GoogleFonts.jost(
          color: ColorConstant.textBlackV2,
          fontWeight: FontWeight.w500,
          fontSize: 18.0,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.profile),
          icon: Icon(
            Iconsax.setting_2_copy,
            color: ColorConstant.textBlackV2,
          ),
        ),
      ],
      elevation: 2.0,
    );
  }
}
