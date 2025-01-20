import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indopustaka/app/controllers/tag_controller.dart';
import 'package:indopustaka/app/data/string_constants.dart';

// ignore: must_be_immutable
class KategoriTag extends GetView {
  TagController tagController = Get.put(TagController());

  KategoriTag({
    super.key,
    required this.jenisKategori,
  });

  final String jenisKategori;

  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var jenjang = box.read(StringConstant.jenjang);
    var idSekolah = box.read(StringConstant.kodeSekolah);

    return Padding(
      padding: const EdgeInsets.fromLTRB(21.0, 0.0, 21.0, 8.0),
      child: Container(
        height: 96.0,
        width: Get.width,
        child: jenisKategori.isCaseInsensitiveContains('perpus')
            ? tagController.listPerpusBuild(
                context,
                idSekolah,
                jenisKategori,
              )
            : tagController.listBuild(
                context,
                int.parse(jenjang),
                jenisKategori,
              ),
      ),
    );
  }
}
