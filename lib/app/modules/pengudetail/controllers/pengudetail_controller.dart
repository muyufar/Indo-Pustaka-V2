import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/pengumuman/pengumuman_model.dart';
import 'package:indopustaka/app/modules/pengudetail/providers/pengudetail_provider.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class PengudetailController extends GetxController {
  PengudetailProvider pengudetailProvider = Get.put(PengudetailProvider());

  Future<PengumumanModel> getDetailPengumuman(
      String idPengumuman, String idSekolah) async {
    var res =
        await pengudetailProvider.detailPengumuman(idPengumuman, idSekolah);

    return res;
  }

  Widget detailBuild(
      BuildContext context, String idPengumuman, String idSekolah) {
    return FutureBuilder<PengumumanModel>(
      future: getDetailPengumuman(idPengumuman, idSekolah),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: _detailView(
              snapshot.data!,
              idPengumuman,
              idSekolah,
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

  Widget _detailView(
      PengumumanModel data, String idPengumuman, String idSekolah) {
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CachedNetworkImage(
                  width: Get.width,
                  height: Get.width / 2,
                  imageUrl: "${data.gambar}",
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Icon(
                      Icons.error,
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  top: 32.0,
                ),
                child: Text(
                  "${data.judul}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Text(
                  "${data.tanggalPosting}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                child: Html(
                  data: data.isiPengumuman,
                  style: {
                    "p": Style(
                      color: Colors.white,
                      fontSize: FontSize.xLarge,
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
