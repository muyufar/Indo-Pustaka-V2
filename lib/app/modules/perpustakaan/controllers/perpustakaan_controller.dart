import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/perpustakaan/perpustakaan_model.dart';
import 'package:indopustaka/app/modules/perpustakaan/providers/perpustakaan_provider.dart';
import 'package:indopustaka/app/modules/profile/controllers/profile_controller.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class PerpustakaanController extends GetxController {
  PerpustakaanProvider perpusProvider = Get.put(PerpustakaanProvider());
  ProfileController profilCont = Get.put(ProfileController());

  TextEditingController cariController = TextEditingController();

  Widget listBuild(BuildContext context, String idSekolah) {
    return FutureBuilder<PerpustakaanResponse>(
      future: perpusProvider.listPerpus(idSekolah),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          PerpustakaanResponse data = snapshot.data!;

          return Container(
            child: listView(data),
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

  Widget listView(PerpustakaanResponse data) {
    if (data.perpustakaanList.isEmpty) {
      return noBukuPerpusData();
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
        ),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.perpustakaanList.length,
            itemBuilder: (context, index) {
              return tileView(data, index);
            },
          ),
        ),
      );
    }
  }

  Widget tileView(PerpustakaanResponse data, int index) {
    var namaKategori =
        data.perpustakaanList[index].namaKategori!.contains("Semua Kategori");

    return Container(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        focusColor: Colors.grey,
        onTap: () {
          var idBukuFisik = data.perpustakaanList[index].idBukuFisik;

          log('IDBUKUFISIKCONT: $idBukuFisik');

          if (namaKategori) {
            Get.toNamed(Routes.perpus, parameters: {
              'title': 'Semua Kategori',
              'cari': '',
            });
          } else {
            Get.toNamed(Routes.perpusdetail, parameters: {
              'id_buku_fisik': idBukuFisik!,
            });
          }
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 33, 33, 33),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: namaKategori ? Colors.blue[900] : Colors.grey[900],
          ),
          child: namaKategori ? bukuSemuaPerpus() : bukuPerpus(data, index),
        ),
      ),
    );
  }

  Widget bukuSemuaPerpus() {
    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.arrow_circle_right,
                color: Colors.white,
                size: 92,
              ),
            ),
            Container(
              child: Text(
                "Lihat lainnya",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bukuPerpus(PerpustakaanResponse data, int index) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.grey,
              ),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: "${data.perpustakaanList[index].cover}",
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: Get.width - (Get.width / 3),
                    padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Text(
                      "${data.perpustakaanList[index].judul}",
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: (Get.width - (Get.width / 3)) - 3,
                    padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Text(
                      "${data.perpustakaanList[index].penulis}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Text(""),
                  ),
                  Container(
                    width: Get.width - (Get.width / 3),
                    padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Text(
                      "${data.perpustakaanList[index].sinopsis}",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
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

  Widget noRiwayatPinjamPerpusData() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          child: Text(
            'Riwayat Kosong',
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
            'Tidak ada riwayat peminjaman',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
