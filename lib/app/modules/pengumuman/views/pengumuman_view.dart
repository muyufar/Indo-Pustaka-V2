import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/string_constants.dart';

import '../controllers/pengumuman_controller.dart';

// ignore: must_be_immutable
class PengumumanView extends GetView<PengumumanController> {
  PengumumanView({super.key});

  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var idSekolah = box.read(StringConstant.kodeSekolah);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengumuman',
          style: TextStyle(
            color: Colors.white,
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
        centerTitle: false,
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 1.5),
                child: Text(
                  'Perhatikan Lagi',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(16.0, 1.5, 8.0, 16.0),
                child: Text(
                  'Pengumuman',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: controller.listBuild(context, idSekolah),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
