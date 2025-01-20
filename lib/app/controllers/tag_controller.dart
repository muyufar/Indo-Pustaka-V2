import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indopustaka/app/data/models/mainhome/kategori/kategori_resp_model.dart';
import 'package:indopustaka/app/data/providers/kategori_provider.dart';
import 'package:indopustaka/app/routes/app_pages.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class TagController extends GetxController {
  KategoriProvider kategoriProvider = Get.put(KategoriProvider());

  Widget listPerpusBuild(
      BuildContext context, String idSekolah, String jenisKategori) {
    return FutureBuilder<KategoriResponse>(
      future: kategoriProvider.listKategori(idSekolah),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _kategoriListView(snapshot.data!, jenisKategori);
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

  Widget listBuild(BuildContext context, int jenjang, String jenisKategori) {
    return FutureBuilder<KategoriResponse>(
      future: kategoriProvider.getKategori(jenjang),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _kategoriListView(snapshot.data!, jenisKategori);
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

  Widget _kategoriListView(KategoriResponse data, String jenisKategori) {
    return ListView.builder(
      itemCount: data.kategoriList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return _kategoriView(data, index, jenisKategori);
      },
    );
    // return GridView.builder(
    //   scrollDirection: Axis.horizontal,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 4,
    //     childAspectRatio: 0.1,
    //     crossAxisSpacing: 3.0,
    //     mainAxisSpacing: 3.0,
    //   ),
    //   itemCount: data.kategoriList.length,
    //   itemBuilder: (context, index) {
    //     return _kategoriView(data, index, jenisKategori);
    //   },
    // );
  }

  Widget _kategoriView(KategoriResponse data, int index, String jenisKategori) {
    void _onTapKategori() {
      var nama = data.kategoriList[index].namaKategori!;
      switch (jenisKategori) {
        case 'perpus':
          Get.toNamed(
            Routes.perpus,
            parameters: {
              'title': nama,
              'cari': nama.contains("Semua Kategori") ? '' : nama,
            },
          );

          break;
        case 'home':
          Get.toNamed(
            Routes.ebook,
            parameters: {
              'title': 'Buku $nama',
              'cari': nama.contains("Semua Kategori") ? '' : nama,
            },
          );

          break;
        default:
          break;
      }
    }

    return InkWell(
      onTap: _onTapKategori,
      child: Container(
        margin: (index == 0)
            ? const EdgeInsets.only(left: 15, right: 10)
            : const EdgeInsets.only(right: 15, left: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        alignment: Alignment.center,
        child: Text(
          '${data.kategoriList[index].namaKategori}',
          style: GoogleFonts.varelaRound(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     var nama = data.kategoriList[index].namaKategori!;
    //     switch (jenisKategori) {
    //       case 'perpus':
    //         Get.toNamed(
    //           Routes.perpus,
    //           parameters: {
    //             'title': nama,
    //             'cari': nama.contains("Semua Kategori") ? '' : nama,
    //           },
    //         );

    //         break;
    //       case 'home':
    //         Get.toNamed(
    //           Routes.ebook,
    //           parameters: {
    //             'title': 'Buku $nama',
    //             'cari': nama.contains("Semua Kategori") ? '' : nama,
    //           },
    //         );

    //         break;
    //       default:
    //         break;
    //     }
    //   },
    //   child: Align(
    //     alignment: Alignment.centerLeft,
    //     child: Container(
    //       height: 64.0,
    //       decoration: BoxDecoration(
    //         color: Colors.grey[900],
    //         borderRadius: BorderRadius.circular(
    //           10.00,
    //         ),
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Container(
    //             height: 28.00,
    //             width: 8.00,
    //             decoration: BoxDecoration(
    //               color: Colors.blue,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(
    //                   10.00,
    //                 ),
    //                 topRight: Radius.circular(
    //                   0.00,
    //                 ),
    //                 bottomLeft: Radius.circular(
    //                   10.00,
    //                 ),
    //                 bottomRight: Radius.circular(
    //                   0.00,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(
    //               left: 8.0,
    //             ),
    //             child: Text(
    //               '${data.kategoriList[index].namaKategori}',
    //               textAlign: TextAlign.left,
    //               style: TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
