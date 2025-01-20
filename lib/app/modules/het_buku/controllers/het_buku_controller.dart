import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/mainhome/buku/het/bukuhet_resp_model.dart';
import 'package:indopustaka/app/modules/het_buku/providers/het_buku_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class HetBukuController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController cariBukuController = TextEditingController();
  HetBukuProvider hetBukuProvider = Get.put(HetBukuProvider());

  final jenjang = ''.obs;
  final idSekolah = ''.obs;
  final jumlahLimit = 0.obs;
  final isEmpty = false.obs;

  var bukuHetList = <BukuHet>[];

  void tambahPage() async {
    jumlahLimit.value = jumlahLimit.value + 10;
    BukuHetResponse data =
        await hetBukuProvider.getBukuHet(idSekolah.value, jumlahLimit.value);
    if (data.bukuHetList.isEmpty) {
      isEmpty.value = true;
    } else {
      bukuHetList.addAll(data.bukuHetList);
    }

    log('JUMLAHLIMIT: ${jumlahLimit.value} \n ISEMPTY: ${isEmpty.value}');

    update();
  }

  Widget listBuild(BuildContext context, String idSekolah) {
    return FutureBuilder<BukuHetResponse>(
      future: hetBukuProvider.getBukuHet(idSekolah, jumlahLimit.value),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          BukuHetResponse model = snapshot.data!;
          bukuHetList.addAll(model.bukuHetList);

          return Container(
            child: _listView(bukuHetList),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                child: NoDataView(
                  pesan: "Tidak ada data yang ditampilkan.",
                ),
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

  Widget _listView(List<BukuHet> bukuCari) {
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

  Widget _tileView(List<BukuHet> bukuCari, int index) {
    return InkWell(
      onTap: () {
        var param = {"id_buku": "${bukuCari[index].idBuku}"};

        Get.toNamed(Routes.bukuDetail, parameters: param);
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
                  color: Colors.grey),
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
      ),
    );
  }
}
