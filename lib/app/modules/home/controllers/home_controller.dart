import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/data/models/menu/menu_model.dart';
import 'package:indopustaka/app/data/models/menu/menu_resp_model.dart';

import 'package:indopustaka/app/modules/home/providers/menu_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/data/string_constants.dart';
import 'package:indopustaka/app/widget/no_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController cariBukuController = TextEditingController();
  TextEditingController roomController = TextEditingController();

  MenuProvider menuProvider = Get.put(MenuProvider());

  var rand = Random();

  final List<int> colorCodes = <int>[
    0xFFF2994A,
    0xFF00BF2A,
    0xFF1E1AFF,
    0xFFFC2828
  ];

  Future<List<MenuResponse>> getMenu(MenuModel menu) async {
    var res = await menuProvider.getMenu(menu);

    return res;
  }

  Widget listBuild(BuildContext context, MenuModel menu) {
    return FutureBuilder<List<MenuResponse>>(
      future: menuProvider.getMenu(menu),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: _jobsListView(snapshot.data!),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
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

  Widget _jobsListView(List<MenuResponse> data) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tileView(data, index);
      },
    );
  }

  void tampilPesan(String pesan) {
    Get.dialog(
      AlertDialog(
        title: Text('Informasi'),
        content: Text(pesan),
        actions: [
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void tampilRoomDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'Masukan nama room video conference',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: TextFormField(
            controller: roomController,
            style: TextStyle(
              color: Colors.grey,
            ),
            keyboardType: TextInputType.number,
            obscureText: false,
            decoration: InputDecoration(
              hintText: "Masukan Nama Room",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.orange,
                ),
              ),
              prefixIcon: Icon(
                Icons.numbers,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (roomController.text.isBlank!) {
                tampilPesan('Nama room masih kosong');
              } else {
                var url = 'https://indopustakaplus.com/vmeet.php?room=';
                var room = '$url${roomController.text}';

                launchUrl(Uri.parse(room));

                Get.back();
              }
            },
            child: Text('Buat'),
          ),
        ],
      ),
    );
  }

  Widget _tileView(List<MenuResponse> data, int index) {
    Random random = Random();
    var box = GetStorage();

    return InkWell(
      splashColor: Colors.grey,
      onTap: () {
        box.write(StringConstant.menuTemp, data[index].namaMenu);
        switch (data[index].tagMenu) {
          case 'tag_ebook':
            Get.toNamed(Routes.menuDetail);
            break;
          case 'tag_perpus':
            Get.toNamed(Routes.perpustakaan);
            break;
          case 'tag_pengumuman':
            Get.toNamed(Routes.pengumuman);
            break;
          case 'tag_conference':
            tampilRoomDialog();
            break;
          case 'tag_multimedia':
            Get.toNamed(Routes.multimedia);
            break;
          default:
            tampilPesan('Under Maintenance');
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(
                      random.nextInt(255),
                      random.nextInt(255),
                      random.nextInt(255),
                      1,
                    ),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: Wrap(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              width: 96,
                              height: 96,
                              fit: BoxFit.fill,
                              imageUrl: data[index].iconMenu!,
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
                      data[index].namaMenu!,
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
