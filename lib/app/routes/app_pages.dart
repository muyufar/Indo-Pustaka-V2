import 'package:get/get.dart';

import '../modules/bookmark/bindings/bookmark_binding.dart';
import '../modules/bookmark/views/bookmark_view.dart';
import '../modules/buku_detail/bindings/buku_detail_binding.dart';
import '../modules/buku_detail/views/buku_detail_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/ebook/bindings/ebook_binding.dart';
import '../modules/ebook/views/ebook_view.dart';
import '../modules/het_buku/bindings/het_buku_binding.dart';
import '../modules/het_buku/views/het_buku_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/keamanan/bindings/keamanan_binding.dart';
import '../modules/keamanan/views/keamanan_view.dart';
import '../modules/kode_sekolah/bindings/kode_sekolah_binding.dart';
import '../modules/kode_sekolah/views/kode_sekolah_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menu_detail/bindings/menu_detail_binding.dart';
import '../modules/menu_detail/views/menu_detail_view.dart';
import '../modules/multidetail/bindings/multidetail_binding.dart';
import '../modules/multidetail/views/multidetail_view.dart';
import '../modules/multidetweb/bindings/multidetweb_binding.dart';
import '../modules/multidetweb/views/multidetweb_view.dart';
import '../modules/multimedia/bindings/multimedia_binding.dart';
import '../modules/multimedia/views/multimedia_view.dart';
import '../modules/pdf/bindings/pdf_binding.dart';
import '../modules/pdf/views/pdf_view.dart';
import '../modules/pengudetail/bindings/pengudetail_binding.dart';
import '../modules/pengudetail/views/pengudetail_view.dart';
import '../modules/pengumuman/bindings/pengumuman_binding.dart';
import '../modules/pengumuman/views/pengumuman_view.dart';
import '../modules/perpus/bindings/perpus_binding.dart';
import '../modules/perpus/views/perpus_view.dart';
import '../modules/perpusdetail/bindings/perpusdetail_binding.dart';
import '../modules/perpusdetail/views/perpusdetail_view.dart';
import '../modules/perpustakaan/bindings/perpustakaan_binding.dart';
import '../modules/perpustakaan/views/perpustakaan_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.menuDetail,
      page: () => MenuDetailView(),
      binding: MenuDetailBinding(),
    ),
    GetPage(
      name: _Paths.bukuDetail,
      page: () => BukuDetailView(),
      binding: BukuDetailBinding(),
    ),
    GetPage(
      name: _Paths.history,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.setting,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.bookmark,
      page: () => BookmarkView(),
      binding: BookmarkBinding(),
    ),
    GetPage(
      name: _Paths.detail,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.ebook,
      page: () => EbookView(),
      binding: EbookBinding(),
    ),
    GetPage(
      name: _Paths.hetBuku,
      page: () => HetBukuView(),
      binding: HetBukuBinding(),
    ),
    GetPage(
      name: _Paths.keamanan,
      page: () => KeamananView(),
      binding: KeamananBinding(),
    ),
    GetPage(
      name: _Paths.perpustakaan,
      page: () => PerpustakaanView(),
      binding: PerpustakaanBinding(),
    ),
    GetPage(
      name: _Paths.pengumuman,
      page: () => PengumumanView(),
      binding: PengumumanBinding(),
    ),
    GetPage(
      name: _Paths.pdf,
      page: () => PdfView(),
      binding: PdfBinding(),
    ),
    GetPage(
      name: _Paths.kodeSekolah,
      page: () => KodeSekolahView(),
      binding: KodeSekolahBinding(),
    ),
    GetPage(
      name: _Paths.multimedia,
      page: () => MultimediaView(),
      binding: MultimediaBinding(),
    ),
    GetPage(
      name: _Paths.multidetail,
      page: () => MultidetailView(),
      binding: MultidetailBinding(),
    ),
    GetPage(
      name: _Paths.pengudetail,
      page: () => PengudetailView(),
      binding: PengudetailBinding(),
    ),
    GetPage(
      name: _Paths.perpusdetail,
      page: () => PerpusdetailView(),
      binding: PerpusdetailBinding(),
    ),
    GetPage(
      name: _Paths.perpus,
      page: () => PerpusView(),
      binding: PerpusBinding(),
    ),
    GetPage(
      name: _Paths.multidetweb,
      page: () => MultidetwebView(),
      binding: MultidetwebBinding(),
    ),
  ];
}
