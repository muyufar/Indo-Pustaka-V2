/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/bg_gambar.png
  AssetGenImage get bgGambar =>
      const AssetGenImage('assets/images/bg_gambar.png');

  /// File path: assets/images/close.png
  AssetGenImage get close => const AssetGenImage('assets/images/close.png');

  /// File path: assets/images/ebook.jpg
  AssetGenImage get ebook => const AssetGenImage('assets/images/ebook.jpg');

  /// File path: assets/images/flutter_logo.png
  AssetGenImage get flutterLogo =>
      const AssetGenImage('assets/images/flutter_logo.png');

  /// File path: assets/images/ic_kembalikan.png
  AssetGenImage get icKembalikan =>
      const AssetGenImage('assets/images/ic_kembalikan.png');

  /// File path: assets/images/ic_notif.png
  AssetGenImage get icNotif =>
      const AssetGenImage('assets/images/ic_notif.png');

  /// File path: assets/images/ic_person.png
  AssetGenImage get icPerson =>
      const AssetGenImage('assets/images/ic_person.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_ip.png
  AssetGenImage get logoIp => const AssetGenImage('assets/images/logo_ip.png');

  /// File path: assets/images/no_image.png
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no_image.png');

  /// File path: assets/images/pencarian.png
  AssetGenImage get pencarian =>
      const AssetGenImage('assets/images/pencarian.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        banner,
        bgGambar,
        close,
        ebook,
        flutterLogo,
        icKembalikan,
        icNotif,
        icPerson,
        logo,
        logoIp,
        noImage,
        pencarian,
        profile
      ];
}

class $AssetsRawGen {
  const $AssetsRawGen();

  /// File path: assets/raw/empty-box.json
  String get emptyBox => 'assets/raw/empty-box.json';

  /// List of all assets
  List<String> get values => [emptyBox];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsRawGen raw = $AssetsRawGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
