import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BookMenu extends StatelessWidget {
  final String deskripsi;
  final String judul;
  final Color warna;

  const BookMenu({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 100,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: Get.width,
            padding: const EdgeInsets.only(
              left: 70,
              right: 10,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  judul,
                  style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Gap(2.0),
                Text(
                  deskripsi,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.varelaRound(
                    fontSize: 11.5,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            margin: EdgeInsets.zero,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: warna,
              child: Icon(Iconsax.book_copy, size: 40, color: Colors.white),
            ),
          ),
        ],
      ),
    );
    // return SizedBox(
    //   width: Get.width / 3,
    //   height: 160,
    //   child: Container(
    //     child: Stack(
    //       children: [
    //         Positioned(
    //           top: 25.0,
    //           child: Container(
    //             width: Get.width / 3,
    //             height: Get.width / 2,
    //             decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Color.fromARGB(255, 33, 33, 33),
    //               ),
    //               borderRadius: BorderRadius.all(
    //                 Radius.circular(10),
    //               ),
    //               color: Colors.grey[900],
    //             ),
    //             child: Column(
    //               children: [
    //                 Container(
    //                   padding: EdgeInsets.fromLTRB(8.0, 26.0, 8.0, 0.0),
    //                   child: Text(
    //                     judul,
    //                     style: TextStyle(
    //                       color: Colors.yellow,
    //                       fontSize: 12.0,
    //                       fontWeight: FontWeight.w400,
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: EdgeInsets.all(8.0),
    //                   child: Text(
    //                     deskripsi,
    //                     softWrap: true,
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                       color: Colors.grey,
    //                       fontSize: 10.0,
    //                       fontWeight: FontWeight.w400,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         detail(),
    //         ikon(),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget detail() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: Colors.orange,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.0, 2.0, 10.0, 3.0),
          child: Text(
            'detail',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget ikon() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: warna,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: warna,
        ),
        child: Icon(
          Icons.menu_book,
          color: Colors.white,
        ),
      ),
    );
  }
}
