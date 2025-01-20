import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfController extends GetxController {
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

  // Future<PDFDocument> pdfRead(String url) async {
  //   PDFDocument doc = await PDFDocument.fromURL(
  //     url,
  //     cacheManager: CacheManager(
  //       Config(
  //         "ippdfCacheKey",
  //         stalePeriod: Duration(
  //           days: 2,
  //         ),
  //         maxNrOfCacheObjects: 10,
  //       ),
  //     ),
  //   );

  //   return doc;
  // }
}
