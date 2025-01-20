import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/menu_multi_detail/menu_multi_detail.dart';
import 'package:indopustaka/app/data/models/menu_multi_detail/menu_multi_detail_resp.dart';
import 'package:indopustaka/app/modules/multidetail/providers/multidetail_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class MultidetailController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController cariController = TextEditingController();

  MultidetailProvider provider = Get.put(MultidetailProvider());

  final isEmpty = false.obs;
  final jumlahLimit = 0.obs;
  final cari = ''.obs;
  final tipe = ''.obs;
  final jenjang = ''.obs;
  final offset = ''.obs;

  var menuMultiDetailList = <MenuMultiDetail>[].obs;

  @override
  void onReady() {
    provider
        .getMenuMultiDetail(
      tipe.value,
      jenjang.value,
      offset.value,
      jumlahLimit.value.toString(),
      cari.value,
    )
        .then(
      (value) {
        if (value.menuMultiDetailList.length < 10) {
          isEmpty.value = true;
        }
      },
    );
    super.onReady();
  }

  void tambahPage() async {
    jumlahLimit.value = jumlahLimit.value + 10;
    MenuMultiDetailResp data = await provider.getMenuMultiDetail(
      tipe.value,
      jenjang.value,
      offset.value,
      jumlahLimit.value.toString(),
      cari.value,
    );

    if (data.menuMultiDetailList.isEmpty) {
      isEmpty.value = true;
    } else {
      menuMultiDetailList.addAll(data.menuMultiDetailList);
    }

    log('JUMLAHLIMIT: ${jumlahLimit.value} \n ISEMPTY: ${isEmpty.value}');

    update();
  }

  Widget listBuild(
    BuildContext context,
    String tipe,
    String jenjang,
    String offset,
    String limit,
    String cari,
  ) {
    return FutureBuilder<MenuMultiDetailResp>(
      future: provider.getMenuMultiDetail(
        tipe,
        jenjang,
        offset,
        limit,
        cari,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MenuMultiDetailResp data = snapshot.data!;
          menuMultiDetailList.addAll(data.menuMultiDetailList);

          return Container(
            child: listView(
              menuMultiDetailList,
              data,
            ),
          );
        } else if (snapshot.hasError) {
          var error = snapshot.error;
          print("HASERROR: $error");

          return Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: noDataView("Tidak ada data yang ditampilkan"),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  listView(RxList<MenuMultiDetail> data, MenuMultiDetailResp dataResp) {
    if (data.isEmpty) {
      return noDataView(dataResp.message);
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

  Widget noDataView(String pesan) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Lottie.asset(
                Assets.raw.emptyBox,
                width: Get.width / 2,
                height: Get.width / 2,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Text(
                pesan,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  tileView(
    RxList<MenuMultiDetail> data,
    int index,
  ) {
    return InkWell(
      onTap: () {
        var idMaster = data[index].idMaster;
        var orientasi = data[index].orientasi;

        print("DATA[ORIENTASI: $orientasi]");

        Get.toNamed(Routes.multidetweb, parameters: {
          'id': idMaster.toString(),
          'tipe': tipe.value,
          'jenjang': jenjang.value,
          'orientasi': orientasi.toString(),
        });
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
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
                  color: Colors.black,
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
