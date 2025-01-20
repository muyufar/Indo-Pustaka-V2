import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/perpustakaan/perpustakaan_model.dart';
import 'package:indopustaka/app/modules/perpus/providers/perpus_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class PerpusController extends GetxController {
  final GlobalKey<ScaffoldState> formKey = GlobalKey();
  TextEditingController cariController = TextEditingController();

  PerpusProvider perpusProvider = Get.put(PerpusProvider());

  final jumlahLimit = 0.obs;
  final isEmpty = false.obs;
  final idSekolah = ''.obs;
  final cari = ''.obs;
  final namaKategori = ''.obs;
  final order = 0.obs;

  var perpusList = <PerpustakaanModel>[].obs;

  void tambahPage() async {
    jumlahLimit.value = jumlahLimit.value + 10;
    PerpustakaanResponse data = await perpusProvider.getAllPerpus(
      jumlahLimit.value,
      idSekolah.value,
      cari.value,
      namaKategori.value,
      order.value,
    );

    if (data.perpustakaanList.isEmpty) {
      isEmpty.value = true;
    } else {
      perpusList.addAll(data.perpustakaanList);
    }

    log('JUMLAHLIMIT: ${jumlahLimit.value} \n ISEMPTY: ${isEmpty.value}');

    update();
  }

  Widget listBuild(
    BuildContext context,
    String idSekolah,
    String namaKategori,
    int jumlahLimit,
    String cari,
    int order,
  ) {
    return FutureBuilder<PerpustakaanResponse>(
      future: perpusProvider.getAllPerpus(
        jumlahLimit,
        idSekolah,
        cari,
        namaKategori,
        order,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          PerpustakaanResponse data = snapshot.data!;
          perpusList.addAll(data.perpustakaanList);

          return Container(
            child: listView(perpusList),
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

  Widget noBukuPerpusData() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: Text(
              'Buku Kosong',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Perpustakaan sekolahmu belum upload buku',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listView(List<PerpustakaanModel> data) {
    if (data.isEmpty) {
      return noBukuPerpusData();
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return tileView(data, index);
        },
      );
    }
  }

  Widget tileView(List<PerpustakaanModel> data, int index) {
    return InkWell(
      onTap: () {
        var param = data[index].idBukuFisik;

        Get.toNamed(Routes.perpusdetail, parameters: {
          'id_buku_fisik': param.toString(),
        });
      },
      child: Container(
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
                child: Container(
                  child: CachedNetworkImage(
                    width: 50,
                    height: 100,
                    fit: BoxFit.fill,
                    imageUrl: data[index].cover!,
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
            ),
            Container(
              width: Get.width / 3,
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                data[index].judul!,
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
      ),
    );
  }
}
