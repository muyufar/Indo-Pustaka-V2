import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indopustaka/app/data/color_constants.dart';

import '../controllers/multimedia_controller.dart';

class MultimediaView extends GetView<MultimediaController> {
  MultimediaView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Multimedia',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Color.fromARGB(
        255,
        212,
        252,
        255,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: controller.listBuild(),
          ),
          Container(
            width: Get.width,
            height: Get.width / 3,
          ),
        ],
      ),
    );
  }
}
