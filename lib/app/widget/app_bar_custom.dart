import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
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
    return Row(
      children: [
        InkWell(
          onTap: () => Get.toNamed(Routes.profile),
          child: CircleAvatar(
            radius: 22.0,
            backgroundImage: CachedNetworkImageProvider(urlImage),
            onBackgroundImageError: (exception, stackTrace) => Icon(
              Iconsax.profile_2user,
            ),
            backgroundColor: Colors.white,
          ),
        ),
        const Gap(8.0),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: GoogleFonts.varelaRound(
                    color: Colors.black87,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  subTitle.capitalizeFirst!,
                  style: GoogleFonts.varelaRound(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
