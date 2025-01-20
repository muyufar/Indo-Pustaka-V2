import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indopustaka/app/data/color_constants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/pdf_controller.dart';

class PdfView extends GetView<PdfController> {
  PdfView({super.key});

  @override
  Widget build(BuildContext context) {
    var judul = Get.parameters['judul'];
    var url = Get.parameters['pdf_url'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          judul ?? 'Baca PDF',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: ColorConstant.abuIp,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Container(
        child: SfPdfViewer.network(
          url.toString(),
          enableTextSelection: false,
          pageLayoutMode: PdfPageLayoutMode.continuous,
          key: controller.pdfViewerKey,
          onDocumentLoaded: (details) {
            showPage(details.document.pages.count.toString());
          },
          onDocumentLoadFailed: (details) {
            showErrorDialog(
              context,
              details.error,
              details.description,
            );
          },
          pageSpacing: 8.0,
        ),
      ),
    );
  }

  void showPage(String page) {
    Align(
      alignment: Alignment.bottomRight,
      child: Text(page),
    );
  }

  void showErrorDialog(BuildContext context, String error, String description) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(error),
          content: Text(description),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
