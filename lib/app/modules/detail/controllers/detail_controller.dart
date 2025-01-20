import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/mainhome/buku/saya/bukusaya_resp_model.dart';
import 'package:indopustaka/app/modules/detail/providers/detail_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class DetailController extends GetxController with StateMixin<dynamic> {
  TextEditingController cariBukuController = TextEditingController();
  ScrollController scrollController = ScrollController();

  DetailProvider provider = Get.put(DetailProvider());

  final isEmpty = true.obs;
  final idUser = ''.obs;
  final jumlahLimit = 0.obs;
  final cari = ''.obs;

  var list = <BukuSaya>[];

  void tambahPage() async {
    jumlahLimit.value = jumlahLimit.value + 10;

    BukuSayaResponse data = await provider.getBukuSaya(
      idUser.value,
      jumlahLimit.value,
      cari.value,
    );

    if (data.bukuSayaList.isEmpty || data.bukuSayaList.length < 10) {
      isEmpty.value = true;
    } else {
      list.addAll(data.bukuSayaList);
    }

    log('JUMLAHLIMIT: ${jumlahLimit.value} \n ISEMPTY: ${isEmpty.value}');

    update();
  }

  Widget listBuild(
      BuildContext context, String idUser, int jumlahLimit, String cari) {
    return FutureBuilder<BukuSayaResponse>(
      future: provider.getBukuSaya(idUser, jumlahLimit, cari),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          BukuSayaResponse model = snapshot.data!;
          list.addAll(model.bukuSayaList);

          return Container(
            child: _listView(list),
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

  Widget _listView(List<BukuSaya> data) {
    if (data.isEmpty) {
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
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tileView(data, index);
        },
      );
    }
  }

  Widget _tileView(List<BukuSaya> data, int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.bukuDetail, parameters: {
          "id_buku": "${data[index].idBuku}",
          "status_pinjam": "${data[index].statusPeminjaman}"
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
