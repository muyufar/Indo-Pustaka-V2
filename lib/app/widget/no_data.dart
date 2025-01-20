import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class NoDataView extends GetView {
  NoDataView({
    super.key,
    required this.pesan,
  });

  final String pesan;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Lottie.asset(
                Assets.raw.emptyBox,
                width: Get.width / 2,
                height: Get.width / 2,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Text(
                pesan,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
