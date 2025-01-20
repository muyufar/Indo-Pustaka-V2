import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorConstant {
  static Color shrinePink50 = Color(0xFFFEEAE6);
  static Color shrinePink100 = Color(0xFFFEDBD0);
  static Color shrinePink300 = Color(0xFFFBB8AC);
  static Color shrinePink400 = Color(0xFFEAA4A4);

  static Color shrineBrown900 = Color(0xFF442B2D);
  static Color shrineBrown600 = Color(0xFF7D4F52);

  static Color shrineErrorRed = Color(0xFFC5032B);

  static Color shrineSurfaceWhite = Color(0xFFFFFBFA);
  static Color shrineBackgroundWhite = Colors.white;

  static Color kuningIp = Color(0xFFFFA732);
  static Color abuIp = Color(0xFF5E5E5E);
  static Color hitamIp = Color(0xFF050522);

  static Color hijau = Color(0xFF00BF2A);
  static Color biru = Color(0xFF1E1AFF);
  static Color abuabu = Color(0xFFE0E0E0);
  static Color merah = Color(0xFFFC2828);
  static Color abu = Color(0xFFEBEBEB);

  static Color indigoA200 = fromHex('#5c59ff');

  static Color red500 = fromHex('#fc2929');

  static Color green800 = fromHex('#0f851a');

  static Color green500 = fromHex('#3dc75c');

  static Color greenA700 = fromHex('#00bf2b');

  static Color greenA701 = fromHex('#00bf29');

  static Color black900 = fromHex('#000000');

  static Color black90040 = fromHex('#40000000');

  static Color deepOrange300 = fromHex('#f78c5c');

  static Color purple500 = fromHex('#e00ab0');

  static Color gray700 = fromHex('#5e5e5e');

  static Color blue900 = fromHex('#0012b8');

  static Color gray500 = fromHex('#999999');

  static Color orangeA200 = fromHex('#f2994a');

  static Color gray901 = fromHex('#262626');

  static Color gray800 = fromHex('#4d4d4d');

  static Color redA200 = fromHex('#ff5959');

  static Color gray801 = fromHex('#4f4f4f');

  static Color gray900 = fromHex('#141414');

  static Color orange400 = fromHex('#ffa633');

  static Color gray200 = fromHex('#ebebeb');

  static Color orange300 = fromHex('#f5a863');

  static Color gray300 = fromHex('#e0e0e0');

  static Color orange300Cc = fromHex('#ccf5a863');

  static Color orange100 = fromHex('#ffdeb3');

  static Color tealA400 = fromHex('#29fcd6');

  static Color gray100 = fromHex('#f2f2f2');

  static Color bluegray900 = fromHex('#333333');

  static Color indigoA700 = fromHex('#1f1aff');

  static Color bluegray401 = fromHex('#888888');

  static Color bluegray400 = fromHex('#8c8c8c');

  static Color whiteA700 = fromHex('#ffffff');

  static Color backgroundV2 = HexColor('FAF3E0');
  static Color textBlackV2 = HexColor('333333');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
