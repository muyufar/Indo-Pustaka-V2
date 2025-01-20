import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:indopustaka/app/data/models/multimedia/mulmed_resp.dart';
import 'package:indopustaka/app/widget/no_data.dart';

import '../controllers/multidetweb_controller.dart';

class MultidetwebView extends GetView<MultidetwebController> {
  MultidetwebView({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters['id'];
    var tipe = Get.parameters['tipe'];
    var jenjang = Get.parameters['jenjang'];
    var orientasi = Get.parameters['orientasi'];

    print("DATA[ORIENTASI: $orientasi]");

    controller.init(orientasi: orientasi.toString());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: mulmedDetail(
          context,
          tipe!,
          jenjang!,
          0.toString(),
          10.toString(),
          id!,
          orientasi.toString(),
        ),
      ),
    );
  }

  Widget mulmedDetail(
    BuildContext context,
    String tipe,
    String jenjang,
    String offset,
    String limit,
    String idMaster,
    String orientasi,
  ) {
    return FutureBuilder<MulMedResp>(
      future: controller.getMulMedDetail(
        tipe,
        jenjang,
        offset,
        limit,
        idMaster,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MulMedResp data = snapshot.data!;

          return (orientasi.toString().contains("0"))
              ? Container(
                  child: Stack(
                    children: [
                      webWidget(data),
                      Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(
                            2.0,
                          ),
                        ),
                        width: Get.width,
                        height: Get.width / 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 8.0,
                                top: 8.0,
                                bottom: 8.0,
                                right: 8.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.grey,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: CachedNetworkImage(
                                    width: 70,
                                    height: 100,
                                    fit: BoxFit.fill,
                                    imageUrl: data.mulmed!.coverBuku!,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                        ),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return Icon(Icons.error);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    child: Text(
                                      "Informasi Buku: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      data.mulmed!.judulBuku!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      data.mulmed!.penulis!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "${data.mulmed!.jumlahPembaca!} Pembaca",
                                      style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 10.0,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : webWidget(data);
        } else if (snapshot.hasError) {
          return Center(
            child: Container(
              child: NoDataView(
                pesan: "Tidak ada data yang ditampilkan",
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

  Container webWidget(MulMedResp data) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(data.mulmed!.urlMaster!),
        ),
        initialSettings: InAppWebViewSettings(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
          useOnDownloadStart: true,
          useOnLoadResource: true,
          allowFileAccessFromFileURLs: true,
          allowUniversalAccessFromFileURLs: true,
          disableDefaultErrorPage: true,
          useHybridComposition: true,
          allowsInlineMediaPlayback: true,
          allowsAirPlayForMediaPlayback: true,
        ),
        onConsoleMessage: (ctrl, consoleMessage) {
          print("DATA[MSG: $consoleMessage]");
        },
        onDownloadStartRequest: (ctrl, downloadStartRequest) {
          if (Platform.isAndroid) {
            controller
                .launchURLFilesDownload(downloadStartRequest.url.toString());
          } else if (Platform.isIOS) {
            controller
                .launchURLFilesDownloadIOS(downloadStartRequest.url.toString());
          } else {
            print("DATA[OS tidak disupport]");
          }
        },
        onPermissionRequest: (controller, permissionRequest) async {
          return PermissionResponse(
            action: PermissionResponseAction.GRANT,
          );
        },
      ),
    );
  }
}
