import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/mainhome/buku/cari/bukucari_resp_model.dart';
import 'package:indopustaka/app/modules/ebook/providers/ebook_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class EbookController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController cariBukuController = TextEditingController();

  EbookProvider ebookProvider = Get.put(EbookProvider());

  var ebookList = <BukuCari>[];

  final isEmpty = false.obs;

  final jenjang = 0.obs;
  final jumlahLimit = 0.obs;
  final namaKategori = ''.obs;
  final cari = ''.obs;
  final order = 0.obs;
  final ebookSet = <BukuCari>{}.obs;
  void tambahPage() async {
    jumlahLimit.value = jumlahLimit.value + 10;
    BukuCariResponse data = await ebookProvider.cariBuku(
      jenjang.value,
      jumlahLimit.value,
      namaKategori.value,
      cari.value,
      order.value,
    );
    if (data.bukuCariList.isEmpty) {
      isEmpty.value = true;
    } else {
      ebookList.addAll(data.bukuCariList);
      change(ebookSet, status: RxStatus.success());
    }

    log('JUMLAHLIMIT: ${jumlahLimit.value} \n ISEMPTY: ${isEmpty.value}');

    // update();
  }

  Widget listBuild(
    BuildContext context,
    int jenjang,
    int jumlahLimit,
    String namaKategori,
    String cari,
    int order,
  ) {
    return FutureBuilder<BukuCariResponse>(
      future: ebookProvider.cariBuku(jenjang, jumlahLimit, namaKategori, cari, order),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          ebookSet.addAll(snapshot.data!.bukuCariList);
          return Container(child: _listView(ebookSet.toList())); // Convert Set to List for display
        } else {
          return Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                child: NoDataView(pesan: "Tidak ada data yang ditampilkan."),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _listView(List<BukuCari> bukuCari) {
    if (bukuCari.isEmpty) {
      return NoDataView(
        pesan: "Tidak ada data yang ditampilkan.",
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: bukuCari.length,
        itemBuilder: (context, index) {
          return _tileView(bukuCari, index);
        },
      );
    }
  }

  Widget dataView(List<BukuCari> bukuCari, int index) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Get.width / 3,
            height: (Get.width / 3) + 35,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.grey,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                width: 50,
                height: 100,
                fit: BoxFit.fill,
                imageUrl: bukuCari[index].cover!,
                progressIndicatorBuilder: (context, url, downloadProgress) {
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
          Container(
            width: Get.width / 3,
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              bukuCari[index].judul!,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tileView(List<BukuCari> bukuCari, int index) {
    return InkWell(
      onTap: () {
        var param = {"id_buku": "${bukuCari[index].idBuku}"};

        Get.toNamed(Routes.bukuDetail, parameters: param);
      },
      child: dataView(bukuCari, index),
    );
  }
}
