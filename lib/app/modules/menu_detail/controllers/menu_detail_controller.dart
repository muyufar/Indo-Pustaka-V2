import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indopustaka/app/modules/menu_detail/providers/buku_menu_provider.dart';

import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

import '../../../data/color_constants.dart';
import '../../../widget/book_menu.dart';

class MenuDetailController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  BukuMenuProvider bukuMenuProvider = Get.put(BukuMenuProvider());
  TextEditingController cariController = TextEditingController();

  final count = 0.obs;
  final jenjang = 0.obs;
  final isEmpty = false.obs;
  var bukuList = <dynamic>[].obs;
  final bukuSet = <dynamic>{}.obs;
  final listCarouselSlider = [
    GestureDetector(
      onTap: () {
        Get.toNamed(Routes.detail);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: BookMenu(
          judul: 'Buku Saya',
          deskripsi:
              'Di dalam sini terdapat file ebook yang sudah kamu pinjam lho. Baca lebih banyak ya? Ingat buku adalah gudang ilmu.',
          warna: ColorConstant.kuningIp,
        ),
      ),
    ),
    InkWell(
      onTap: () {
        Get.toNamed(
          Routes.ebook,
          parameters: {
            "title": "Pinjam E-Buku",
            "cari": "",
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: BookMenu(
          judul: 'Pinjam E-book',
          deskripsi:
              'Di dalam sini terdapat file ebook yang bisa kamu pinjam secara gratis lho. Baca buku digital lebih simpel dan lebih mudah di dalam aplikasi.',
          warna: ColorConstant.hijau,
        ),
      ),
    ),
    InkWell(
      onTap: () {
        Get.toNamed(Routes.hetBuku);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: BookMenu(
          judul: 'Buku HET',
          deskripsi:
              'Di dalam sini terdapat file ebook yang bisa kamu pinjam secara gratis dan untuk menunjang pembelajaranmu lho.',
          warna: ColorConstant.merah,
        ),
      ),
    ),
  ];

  void tambahPage() async {
    count.value = count.value + 10;
    List<dynamic> data =
        await bukuMenuProvider.getBukuMenu(jenjang.value, count.value);
    if (data.isEmpty) {
      isEmpty.value = true;
    } else {
      bukuSet.addAll(data); // Add to the Set (duplicates will be ignored)
      change(null, status: RxStatus.success());
    }

    log('JUMLAHLIMIT: ${count.value} \n ISEMPTY: ${isEmpty.value}');

    // update();
  }

  Widget listBuild(BuildContext context, int jenjang) {
    return Obx(() {
      // Make it reactive to bukuSet changes
      return FutureBuilder<List<dynamic>>(
        future: bukuMenuProvider.getBukuMenu(jenjang, count.value),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            bukuSet.addAll(snapshot.data!); // Add to the Set for unique items
            return Container(child: _jobsListView(bukuSet.toList()));
          } else {
            return Center(
                child: NoDataView(pesan: "Tidak ada data yang ditampilkan."));
          }
        },
      );
    });
  }

  Widget _jobsListView(List<dynamic> buku) {
    if (buku.isEmpty) {
      return NoDataView(
        pesan: "Tidak ada data yang ditampilkan.",
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: buku.length,
        itemBuilder: (context, index) {
          return _tileView(buku, index);
        },
      );
    }
  }

  Widget _tileView(List<dynamic> buku, int index) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: index == 0 ? 0 : 10,
        ),
        child: InkWell(
          focusColor: Colors.grey,
          onTap: () {
            var param = {"id_buku": "${buku[index]['id_buku']}"};
            Get.toNamed(Routes.bukuDetail, parameters: param);
          },
          child: Container(
            width: Get.width,
            height: Get.width / 2,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    width: Get.width,
                    padding: const EdgeInsets.only(
                      left: 120,
                      right: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2,
                          spreadRadius: 3,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            buku[index]['judul'],
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.varelaRound(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.5,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            buku[index]['penulis'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.varelaRound(
                              fontSize: 10,
                              color: Colors.black87,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            buku[index]['sinopsis'],
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.varelaRound(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.5 / 2.2,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -2),
                        color: Colors.grey.shade100,
                        spreadRadius: 2,
                        blurRadius: 3,
                      )
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        errorListener: (value) => AspectRatio(
                          aspectRatio: 1.5 / 2.2,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        imageUrl: buku[index]['cover'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // child: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //         border: Border.all(color: Colors.grey),
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(10),
            //         ),
            //         color: Colors.grey,
            //       ),
            //       child: AspectRatio(
            //         aspectRatio: 2 / 3,
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(10.0),
            //           child: CachedNetworkImage(
            //             width: 50,
            //             height: 100,
            //             fit: BoxFit.fill,
            //             imageUrl: "${buku[index]['cover']}",
            //             progressIndicatorBuilder:
            //                 (context, url, downloadProgress) {
            //               return Center(
            //                 child: CircularProgressIndicator(
            //                   value: downloadProgress.progress,
            //                 ),
            //               );
            //             },
            //             errorWidget: (context, url, error) {
            //               return Icon(Icons.error);
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       width: Get.width / 2,
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Container(
            //             padding: EdgeInsets.only(
            //               left: 8.0,
            //               right: 8.0,
            //             ),
            //             child: Text(
            //               "${buku[index]['judul']}",
            //               maxLines: 2,
            //               overflow: TextOverflow.ellipsis,
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 14.0,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             padding: EdgeInsets.only(
            //               left: 8.0,
            //               right: 8.0,
            //             ),
            //             child: Text(
            //               "${buku[index]['penulis']}",
            //               maxLines: 1,
            //               overflow: TextOverflow.ellipsis,
            //               style: TextStyle(
            //                 color: Colors.blue,
            //                 fontSize: 10.0,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             padding: EdgeInsets.only(
            //               left: 8.0,
            //               right: 8.0,
            //             ),
            //             child: Text(""),
            //           ),
            //           Container(
            //             padding: EdgeInsets.only(
            //               left: 8.0,
            //               right: 8.0,
            //             ),
            //             child: Text(
            //               "${buku[index]['sinopsis']}",
            //               maxLines: 4,
            //               overflow: TextOverflow.ellipsis,
            //               style: TextStyle(
            //                 color: Colors.green,
            //                 fontSize: 14.0,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
