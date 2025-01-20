// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buku_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuMenu _$BukuMenuFromJson(Map<String, dynamic> json) => BukuMenu(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BukuMenuToJson(BukuMenu instance) => <String, dynamic>{
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      idBuku: json['id_buku'] as String?,
      judul: json['judul'] as String?,
      sinopsis: json['sinopsis'] as String?,
      penulis: json['penulis'] as String?,
      penerbit: json['penerbit'] as String?,
      kdKategori: json['kd_kategori'] as String?,
      namaKategori: json['nama_kategori'] as String?,
      halaman: json['halaman'] as String?,
      cover: json['cover'] as String?,
      pdfUrl: json['pdf_url'] as String?,
      statusFile: json['status_file'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id_buku': instance.idBuku,
      'judul': instance.judul,
      'sinopsis': instance.sinopsis,
      'penulis': instance.penulis,
      'penerbit': instance.penerbit,
      'kd_kategori': instance.kdKategori,
      'nama_kategori': instance.namaKategori,
      'halaman': instance.halaman,
      'cover': instance.cover,
      'pdf_url': instance.pdfUrl,
      'status_file': instance.statusFile,
    };
