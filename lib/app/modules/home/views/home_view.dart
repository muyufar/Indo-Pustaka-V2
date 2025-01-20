import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      backgroundColor: Color(0xFF16142C),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: AspectRatio(
                      aspectRatio: 4 / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(Assets.images.banner.path),
                          ),
                        ),
                        child: Column(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Fitur",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height / 2,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar ipAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        StringConstant.namaAplikasi,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      actions: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.profile);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Icon(
              Icons.person,
              size: 34.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
      backgroundColor: Color(0xFF16142C),
      elevation: 0.0,
    );
  }
}
