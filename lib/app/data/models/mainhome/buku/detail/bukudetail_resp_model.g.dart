// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bukudetail_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuDetailResponse _$BukuDetailResponseFromJson(Map<String, dynamic> json) =>
    BukuDetailResponse(
      bukuDetailList: (json['result'] as List<dynamic>)
          .map((e) => BukuDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BukuDetailResponseToJson(BukuDetailResponse instance) =>
    <String, dynamic>{
      'result': instance.bukuDetailList,
    };

BukuDetail _$BukuDetailFromJson(Map<String, dynamic> json) => BukuDetail(
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
      statusBookmark: json['status_bookmark'] as String?,
      stokBukuFormat: json['stok_buku_format'] as String?,
      stokBuku: json['stok_buku'] as String?,
    );

Map<String, dynamic> _$BukuDetailToJson(BukuDetail instance) =>
    <String, dynamic>{
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
      'status_bookmark': instance.statusBookmark,
      'stok_buku_format': instance.stokBukuFormat,
      'stok_buku': instance.stokBuku,
    };
