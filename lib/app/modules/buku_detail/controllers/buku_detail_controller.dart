import 'package:get/get.dart';
import 'package:indopustaka/app/controllers/peminjaman_controller.dart';
import 'package:indopustaka/app/controllers/pengembalian_controller.dart';
import 'package:indopustaka/app/data/models/mainhome/buku/detail/bukudetail_model.dart';
import 'package:indopustaka/app/data/models/mainhome/buku/detail/bukudetail_resp_model.dart';
import 'package:indopustaka/app/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:indopustaka/app/modules/buku_detail/providers/buku_detail_provider.dart';

class BukuDetailController extends GetxController with StateMixin<dynamic> {
  BukuDetailProvider bukuDetailProvider = Get.put(BukuDetailProvider());
  BookmarkController bookmarkController = Get.put(BookmarkController());
  PeminjamanController peminjamanController = Get.put(PeminjamanController());
  PengembalianController pengembalianController =
      Get.put(PengembalianController());

  Future<BukuDetailResponse> getBukuDetail(
      String jenjang, String idBuku, String idSekolah, String idUser) async {
    var bukuDetail = BukuDetailModel();
    bukuDetail.jenjang = jenjang;
    bukuDetail.idBuku = idBuku;
    bukuDetail.idSekolah = idSekolah;
    bukuDetail.idUser = idUser;

    var res = await bukuDetailProvider.getBukuDetail(bukuDetail);

    return res;
  }
}
