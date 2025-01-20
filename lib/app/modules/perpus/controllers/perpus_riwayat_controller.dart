import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/res_model.dart';
import 'package:indopustaka/app/data/models/riwayatperpus/riwayat_perpus_model.dart';
import 'package:indopustaka/app/modules/perpus/providers/perpus_provider.dart';
import 'package:indopustaka/app/widget/no_data.dart';

class PerpusRiwayatController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  PerpusProvider perpusProvider = Get.put(PerpusProvider());

  final idUserFisik = ''.obs;
  final jumlahLimit = 0.obs;
  final isEmpty = false.obs;

  var riwayatPerpusList = <RiwayatPerpus>[].obs;

  void tambahPage() async {
    jumlahLimit.value = jumlahLimit.value + 10;
    RiwayatPerpusResponse data = await perpusProvider.getRiwayatPerpus(
        idUserFisik.value, jumlahLimit.value);
    if (data.riwayatPerpusList.isEmpty) {
      isEmpty.value = true;
    } else {
      riwayatPerpusList.addAll(data.riwayatPerpusList);
    }

    log('JUMLAHLIMIT: ${jumlahLimit.value} \n ISEMPTY: ${isEmpty.value}');

    update();
  }

  void batalPinjam(String idPeminjamanFisik) async {
    var res = await perpusProvider.batalkanPeminjaman(idPeminjamanFisik);
    if (res.statusCode == 200) {
      var resp = await res.stream.bytesToString();
      var model = resModelFromJson(resp);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(model.message.toString()),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
                update();
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    } else if (res.statusCode == 400) {
      var bad = await res.stream.bytesToString();
      var pesan = resModelFromJson(bad);

      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text(pesan.message.toString()),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Ok'),
            )
          ],
        ),
      );
    } else {
      Get.dialog(
        AlertDialog(
          title: Text('Informasi'),
          content: Text('Terjadi kesalahan. Coba lagi nanti'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }

    update();
  }

  Widget listBuild(BuildContext context, String idUserFisik, int jumlahLimit) {
    return FutureBuilder<RiwayatPerpusResponse>(
      future: perpusProvider.getRiwayatPerpus(idUserFisik, jumlahLimit),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          RiwayatPerpusResponse data = snapshot.data!;
          riwayatPerpusList.addAll(data.riwayatPerpusList);

          return Container(
            child: listView(riwayatPerpusList),
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

  Widget listView(List<RiwayatPerpus> data) {
    if (data.isEmpty) {
      return noBukuPerpusData();
    } else {
      return Container(
        padding: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return tileView(data, index);
          },
        ),
      );
    }
  }

  Widget tileView(List<RiwayatPerpus> data, int index) {
    return Container(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 8.0,
      ),
      child: InkWell(
        focusColor: Colors.grey,
        onTap: () {
          String statusPinjam = '';

          switch (data[index].statusPeminjamanFisik) {
            case 'YB':
              statusPinjam =
                  'Ambil buku ini di perpustakaan dengan menunjukkan kode buku yang kamu pinjam di aplikasi ini.';
              break;
            case 'YA':
              statusPinjam =
                  'Buku ini sudah diambil dengan jangka waktu yang sudah ditentukan. Jika kamu ingin memperpanjang masa peminjaman harap hubungi petugas perpustakaan sekolahmu ya.';
              break;
            case 'KB':
              statusPinjam =
                  'Buku ini sudah waktu nya untuk kembali, segera kembalikan buku ini atau perpanjang masa peminjaman buku ini dengan menghubungi petugas perpustakaan sekolahmu.';
              break;
            case 'KA':
              statusPinjam = 'Buku ini sudah dikembalikan.';
              break;
            case 'N':
              statusPinjam = 'Peminjaman buku ini dibatalkan.';
              break;
            default:
              statusPinjam = 'Status tidak diketahui.';
              break;
          }

          Get.dialog(
            AlertDialog(
              title: Text('Informasi'),
              content: Text(statusPinjam),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Ok'),
                ),
              ],
            ),
          );
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
            color: Colors.grey[900],
          ),
          child: riwayatPerpus(data, index),
        ),
      ),
    );
  }

  Widget riwayatPerpus(List<RiwayatPerpus> data, int index) {
    String statusPinjam = '';
    String statusAmbil = '';
    Color statusWarna = Colors.white;
    bool statusTombol = false;
    switch (data[index].statusPeminjamanFisik) {
      case 'YB':
        statusTombol = true;
        statusWarna = Colors.blue;
        statusAmbil = 'Belum Diambil';
        statusPinjam =
            'Ambil buku ini di perpustakaan dengan menunjukkan kode buku yang kamu pinjam di aplikasi ini.';
        break;
      case 'YA':
        statusWarna = Colors.green;
        statusAmbil = 'Sudah Diambil';
        statusPinjam =
            'Buku ini sudah diambil dengan jangka waktu yang sudah ditentukan. Jika kamu ingin memperpanjang masa peminjaman harap hubungi petugas perpustakaan sekolahmu ya.';
        break;
      case 'KB':
        statusWarna = Colors.yellow;
        statusAmbil = 'Batas Waktu Kembali';
        statusPinjam =
            'Buku ini sudah waktu nya untuk kembali, segera kembalikan buku ini atau perpanjang masa peminjaman buku ini dengan menghubungi petugas perpustakaan sekolahmu.';
        break;
      case 'KA':
        statusWarna = Colors.blueGrey;
        statusAmbil = 'Dikembalikan';
        statusPinjam = 'Buku ini sudah dikembalikan.';
        break;
      case 'N':
        statusWarna = Colors.red;
        statusAmbil = 'Dibatalkan';
        statusPinjam = 'Peminjaman buku ini dibatalkan.';
        break;
      default:
        statusAmbil = 'Status tidak diketahui';
        statusPinjam = 'Status tidak diketahui.';
        break;
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text(
              '${data[index].tanggalPeminjamanFisik}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            child: Text(
              '${data[index].judul}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              '${data[index].kodePinjamFisik}',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            child: Text(
              '${data[index].jumlahPeminjamanFisik}',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
          Container(
            child: Text(
              'Batas Peminjaman',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Text(
              '${data[index].tanggalExpPeminjamanFisik}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text(
                    statusAmbil,
                    style: TextStyle(
                      color: statusWarna,
                    ),
                  ),
                ),
                statusTombol
                    ? Container(
                        padding: EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.dialog(
                              AlertDialog(
                                title: Text(
                                  'Apakah kamu yakin untuk membatalkan peminjaman buku ini?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text(
                                    'Jangan lupa untuk membaca buku ya... Ingat buku adalah gudangnya ilmu.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text('Tidak jadi'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      batalPinjam(
                                          data[index].idPeminjamanModel!);
                                      Get.back();
                                    },
                                    child: Text("Ya, Batalkan"),
                                  )
                                ],
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Batalkan Pinjaman"),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.menu_book,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Text(
                      statusPinjam,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
