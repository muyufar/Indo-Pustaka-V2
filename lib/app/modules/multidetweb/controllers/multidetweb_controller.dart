import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/multimedia/mulmed_resp.dart';
import 'package:indopustaka/app/modules/multidetweb/providers/multidetweb_provider.dart';
import 'package:path_provider/path_provider.dart';

class MultidetwebController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final loadingPercentage = 0.obs;

  MultiDetWebProvider provider = Get.put(MultiDetWebProvider());

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.onClose();
  }

  void init({required String orientasi}) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    if (orientasi == '0') {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    }
  }

  void onTapBack() {
    Get.back();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
      ],
    );
  }

  Future<MulMedResp> getMulMedDetail(
    String tipe,
    String jenjang,
    String offset,
    String limit,
    String idMaster,
  ) async {
    var res = await provider.getMulMedDetail(
      tipe,
      jenjang,
      offset,
      limit,
      idMaster,
    );

    return res;
  }

  void launchURLFilesDownload(String urlfiles) async {
    String imageBase64 = urlfiles.replaceAll('data:image/png;base64,', '');

    Uint8List byteImage = base64.decode(imageBase64);
    print("DATA[BASE64: $byteImage");

    final dir = await getExternalStorageDirectory();
    print("DATA[DIR: $dir]");

    // final myImagePath =
    //     "$dir/${DateTime.now().toString().replaceAll('.', '').replaceAll(':', '-')}.png";

    final myImagePath =
        "/sdcard/DCIM/indopustaka ${DateTime.now().toString().replaceAll('.', '').replaceAll(':', '-')}.png";

    File(myImagePath).writeAsBytesSync(byteImage);
    print("DATA[PATH: $myImagePath]");

    Get.snackbar(
      'Download Image Berhasil',
      'Silakan cek gambarnya di galery anda',
      backgroundColor: Colors.white,
    );
  }

  void launchURLFilesDownloadIOS(String urlfiles) async {
    String imageBase64 = urlfiles.replaceAll('data:image/png;base64,', '');

    Uint8List byteImage = base64.decode(imageBase64);

    final result = await ImageGallerySaver.saveImage(byteImage,
        quality: 60,
        name:
            "indopustaka ${DateTime.now().toString().replaceAll('.', '').replaceAll(':', '-')}");
    print(result);

    Get.snackbar(
      'Download Image Berhasil',
      'Silakan cek gambarnya di galery anda',
      backgroundColor: Colors.white,
    );
  }
}
