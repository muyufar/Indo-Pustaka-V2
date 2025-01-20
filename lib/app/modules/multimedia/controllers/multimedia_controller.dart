import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/menu_multi/menu_multi_resp.dart';
import 'package:indopustaka/app/modules/multimedia/providers/multimedia_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class MultimediaController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController cariBukuController = TextEditingController();

  MultimediaProvider provider = Get.put(MultimediaProvider());

  final cari = ''.obs;

  Widget listBuild() {
    return FutureBuilder<MenuMultiResponse>(
      future: provider.getMenuMulti(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MenuMultiResponse data = snapshot.data!;

          return Container(
            alignment: Alignment.topLeft,
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

  Widget listView(MenuMultiResponse data) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.menuMultiList.length,
      itemBuilder: (context, index) {
        return Align(
          alignment:
              (index % 2 == 0) ? Alignment.centerLeft : Alignment.centerRight,
          child: (index == data.menuMultiList.length - 1)
              ? Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: tileView(data, index),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: tileView(data, index),
                ),
        );
      },
    );
  }

  Widget tileView(MenuMultiResponse data, int index) {
    return InkWell(
      onTap: () {
        String? tipe = data.menuMultiList[index].tipeMenu;

        print("DATA[TIPE: $tipe]");

        Get.toNamed(Routes.multidetail, parameters: {
          'tipe': tipe.toString(),
        });
      },
      child: Container(
        width: Get.width / 2,
        height: Get.height / 4,
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Column(
              children: [
                Container(
                  child: Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              width: 250,
                              height: 260,
                              fit: BoxFit.fill,
                              imageUrl: data.menuMultiList[index].iconMenu!,
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
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
