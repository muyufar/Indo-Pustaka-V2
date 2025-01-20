import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/string_constants.dart';

import '../controllers/pengudetail_controller.dart';

// ignore: must_be_immutable
class PengudetailView extends GetView<PengudetailController> {
  PengudetailView({super.key});

  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var idPengumuman = Get.parameters['id_pengumuman'];
    var idSekolah = box.read(StringConstant.kodeSekolah);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
        height: Get.height,
        padding: EdgeInsets.fromLTRB(23.0, 16.0, 20.0, 8.0),
        child: Column(
          children: [
            Container(
              child: controller.detailBuild(context, idPengumuman!, idSekolah),
            ),
          ],
        ),
      ),
    );
  }
}
