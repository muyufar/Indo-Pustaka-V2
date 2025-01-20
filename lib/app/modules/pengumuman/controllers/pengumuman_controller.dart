import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/pengumuman/pengumuman_model.dart';
import 'package:indopustaka/app/modules/pengumuman/providers/pengumuman_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class PengumumanController extends GetxController {
  PengumumanProvider pengumumanProvider = Get.put(PengumumanProvider());

  Widget noData(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: Text(
              'Pengumuman Kosong',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              'Belum ada pengumuman. ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Text(
              'Silakan refresh terus halaman ini. ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
            child: Text(
              'Siapa tahu ada pengumuman baru.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listBuild(BuildContext context, String idSekolah) {
    return FutureBuilder<List<PengumumanModel>>(
      future: pengumumanProvider.listPengumunan(idSekolah),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PengumumanModel> data = snapshot.data!;
          return Container(
            padding: EdgeInsets.all(8.0),
            child: _listView(context, data),
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

  Widget _listView(BuildContext context, List<PengumumanModel> data) {
    if (data.isEmpty) {
      return noData(context);
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(
              bottom: 16.0,
            ),
            child: _tileView(
              context,
              data,
              index,
            ),
          );
        },
      );
    }
  }

  Widget _tileView(
    BuildContext context,
    List<PengumumanModel> data,
    int index,
  ) {
    return InkWell(
      onTap: () {
        var param = {"id_pengumuman": "${data[index].idPengumuman}"};

        Get.toNamed(Routes.pengudetail, parameters: param);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.pink[900],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                data[index].judul!,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Html(
                data: data[index].isiPengumuman,
                style: {
                  "p": Style(
                    color: Colors.white,
                  ),
                },
              ),
            ),
            Container(
              width: Get.width,
              height: Get.width / 6,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                data[index].tanggalPosting!,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
