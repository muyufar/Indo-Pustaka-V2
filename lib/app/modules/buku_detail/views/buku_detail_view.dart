import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/models/mainhome/buku/detail/bukudetail_resp_model.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

import '../controllers/buku_detail_controller.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/string_constants.dart';

// ignore: must_be_immutable
class BukuDetailView extends GetView<BukuDetailController> {
  final box = GetStorage();
  String statusPinjam = Get.parameters['status_pinjam'].toString();

  @override
  Widget build(BuildContext context) {
    var idBuku = Get.parameters['id_buku'];
    var idAnggota = box.read(StringConstant.idAnggota);
    var kodeSekolah = box.read(StringConstant.kodeSekolah);
    var jenjang = box.read(StringConstant.jenjang);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Buku',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.share,
                size: 19.0,
                color: ColorConstant.abuIp,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<BukuDetailResponse>(
        future: controller.getBukuDetail(
          jenjang,
          idBuku!,
          kodeSekolah,
          idAnggota,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: _detailView(
                snapshot.data!,
                idBuku,
                kodeSekolah,
                idAnggota,
                jenjang,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Container(
                child: NoDataView(
                  pesan: "Tidak ada data yang ditampilkan.",
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _detailView(
    BukuDetailResponse data,
    var idBuku,
    var kodeSekolah,
    var idAnggota,
    var jenjang,
  ) {
    return GetBuilder<BukuDetailController>(
      builder: (value) {
        return ListView.builder(
          itemCount: data.bukuDetailList.length,
          itemBuilder: (context, index) {
            return _tileView(
              data,
              index,
              idBuku,
              kodeSekolah,
              idAnggota,
              jenjang,
            );
          },
        );
      },
    );
  }

  Widget _tileView(
    BukuDetailResponse data,
    int index,
    var idBuku,
    var kodeSekolah,
    var idAnggota,
    var jenjang,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.black,
              ),
              child: AspectRatio(
                aspectRatio: 5 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    child: CachedNetworkImage(
                      width: 50,
                      height: 100,
                      fit: BoxFit.contain,
                      imageUrl: data.bukuDetailList[index].cover!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Icon(Icons.error);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: Get.width,
          height: Get.height / 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 33, 33, 33),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Color.fromARGB(255, 33, 33, 33),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 27.0, 9.0, 0.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.book,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${data.bukuDetailList[index].stokBuku} Buku Tersedia',
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: Get.width / 3.5,
                          ),
                          child: Text(
                            '${data.bukuDetailList[index].judul}',
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${data.bukuDetailList[index].penulis}',
                              softWrap: true,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 19.0,
                          ),
                          child: Text(
                            '${data.bukuDetailList[index].sinopsis}',
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (statusPinjam == 'Y') {
                                      controller.pengembalianController
                                          .kembalikan(
                                              idBuku, idAnggota, kodeSekolah);
                                      controller.update();
                                    } else {
                                      controller.peminjamanController.pinjam(
                                          idBuku,
                                          idAnggota,
                                          kodeSekolah,
                                          jenjang);
                                      controller.update();
                                    }
                                  },
                                  child: Text(
                                    statusPinjam == 'Y'
                                        ? 'Kembalikan'
                                        : 'Pinjam Buku',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              if (statusPinjam == 'Y')
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding:
                                      EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      var judul =
                                          data.bukuDetailList[index].judul;
                                      var url =
                                          data.bukuDetailList[index].pdfUrl;

                                      Get.toNamed(Routes.pdf, parameters: {
                                        "judul": judul.toString(),
                                        "pdf_url": url.toString(),
                                      });
                                    },
                                    child: Text(
                                      'Baca Buku',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorConstant.kuningIp,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 52.0 / 2,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorConstant.kuningIp,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: ColorConstant.kuningIp,
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (data.bukuDetailList[index].statusBookmark ==
                                  'Y') {
                                controller.bookmarkController.hapusBookmark(
                                    idAnggota, idBuku, kodeSekolah);
                              } else {
                                controller.bookmarkController.tambahBookmark(
                                    idAnggota, idBuku, kodeSekolah);
                              }
                            },
                            icon: Icon(
                              data.bukuDetailList[index].statusBookmark == 'Y'
                                  ? Icons.bookmark_outlined
                                  : Icons.bookmark_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
