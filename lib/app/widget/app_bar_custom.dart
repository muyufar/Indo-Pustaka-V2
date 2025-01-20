import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/routes/app_pages.dart';

class AppBarCustom extends GetView {
  final String urlImage;
  final String title;
  final String subTitle;

  AppBarCustom({
    Key? key,
    required this.urlImage,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.profile);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(urlImage),
                  fit: BoxFit.fill,
                ),
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white,
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
}
