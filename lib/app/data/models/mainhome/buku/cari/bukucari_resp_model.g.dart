// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bukucari_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuCariResponse _$BukuCariResponseFromJson(Map<String, dynamic> json) =>
    BukuCariResponse(
      bukuCariList: (json['result'] as List<dynamic>)
          .map((e) => BukuCari.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BukuCariResponseToJson(BukuCariResponse instance) =>
    <String, dynamic>{
      'result': instance.bukuCariList,
    };

BukuCari _$BukuCariFromJson(Map<String, dynamic> json) => BukuCari(
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

Map<String, dynamic> _$BukuCariToJson(BukuCari instance) => <String, dynamic>{
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
