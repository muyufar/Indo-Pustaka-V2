import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indopustaka/app/widget/custom_drawer.dart';

import '../controllers/setting_controller.dart';
import 'package:indopustaka/app/data/color_constants.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(
            color: ColorConstant.abuIp,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
      ),
      drawer: IndopustakaDrawer(),
      body: Center(
        child: Text(
          'SettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
