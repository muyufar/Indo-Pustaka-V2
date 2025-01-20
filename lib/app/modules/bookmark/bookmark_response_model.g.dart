// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkResponseModel _$BookmarkResponseModelFromJson(
        Map<String, dynamic> json) =>
    BookmarkResponseModel(
      idBuku: json['idBuku'] as String?,
      judul: json['judul'] as String?,
      sinopsis: json['sinopsis'] as String?,
      penulis: json['penulis'] as String?,
      penerbit: json['penerbit'] as String?,
      namaKategori: json['nama_kategori'] as String?,
      halaman: json['halaman'] as String?,
      cover: json['cover'] as String?,
      pdfUrl: json['pdf_url'] as String?,
      statusFile: json['status_file'] as String?,
    );

Map<String, dynamic> _$BookmarkResponseModelToJson(
        BookmarkResponseModel instance) =>
    <String, dynamic>{
      'idBuku': instance.idBuku,
      'judul': instance.judul,
      'sinopsis': instance.sinopsis,
      'penulis': instance.penulis,
      'penerbit': instance.penerbit,
      'nama_kategori': instance.namaKategori,
      'halaman': instance.halaman,
      'cover': instance.cover,
      'pdf_url': instance.pdfUrl,
      'status_file': instance.statusFile,
    };
