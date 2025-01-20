import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indopustaka/app/widget/custom_drawer.dart';

import '../controllers/history_controller.dart';
import 'package:indopustaka/app/data/color_constants.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            color: ColorConstant.abuIp,
          ),
        ),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: IndopustakaDrawer(),
      body: Center(
        child: Text(
          'HistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
