import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:indopustaka/app/data/models/perpustakaan/perpustakaan_model.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/widget/no_data.dart';

import '../controllers/perpusdetail_controller.dart';

// ignore: must_be_immutable
class PerpusdetailView extends GetView<PerpusdetailController> {
  PerpusdetailView({super.key});

  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var idUserFisik = box.read(StringConstant.idAnggota);
    var idBukuFisik = Get.parameters['id_buku_fisik'];
    var idSekolahFisik = box.read(StringConstant.kodeSekolah);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buku Perpustakaan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: getPerpusDetail(
          idUserFisik,
          idBukuFisik!,
          idSekolahFisik,
        ),
      ),
    );
  }

  Widget getPerpusDetail(
    String idUserFisik,
    String idBukuFisik,
    String idSekolahFisik,
  ) {
    return FutureBuilder<PerpustakaanResponse>(
      future: controller.provider.getPerpusDetail(idBukuFisik),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          PerpustakaanResponse data = snapshot.data!;

          return Container(
            child: listView(
              data,
              idUserFisik,
              idBukuFisik,
              idSekolahFisik,
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
    );
  }

  Widget listView(
    PerpustakaanResponse data,
    String idUserFisik,
    String idBukuFisik,
    String idSekolahFisik,
  ) {
    return ListView.builder(
      itemCount: data.perpustakaanList.length,
      itemBuilder: (context, index) {
        return tileView(
          data,
          index,
          idUserFisik,
          idBukuFisik,
          idSekolahFisik,
        );
      },
    );
  }

  Widget tileView(
    PerpustakaanResponse data,
    int index,
    String idUserFisik,
    String idBukuFisik,
    String idSekolahFisik,
  ) {
    controller.stok.value =
        int.parse(data.perpustakaanList[index].stokBuku.toString());

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey,
                ),
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      child: CachedNetworkImage(
                        width: 50,
                        height: 100,
                        fit: BoxFit.fill,
                        imageUrl: data.perpustakaanList[index].cover!,
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
                          Padding(
                            padding: EdgeInsets.only(
                              right: Get.width / 3.5,
                            ),
                            child: Text(
                              '${data.perpustakaanList[index].judul}',
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
                                '${data.perpustakaanList[index].penulis}',
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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: Text(
                                    '${data.perpustakaanList[index].stokBuku} Buku Tersedia',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller.kurangiJumlah();
                                          },
                                          child: Text('-'),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          bottom: 8.0,
                                          top: 8.0,
                                        ),
                                        alignment: Alignment.center,
                                        child: Obx(
                                          () => Text(
                                            '${controller.jumlah.value}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller.tambahJumlah();
                                          },
                                          child: Text('+'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              'Deskripsi Buku',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 12.0,
                            ),
                            child: Text(
                              '${data.perpustakaanList[index].sinopsis}',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 12.0,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.pinjamBukuPerpus(
                                  idUserFisik,
                                  idBukuFisik,
                                  idSekolahFisik,
                                  controller.jumlah.value,
                                );
                              },
                              child: Text('Pinjam Buku'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
