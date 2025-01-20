// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perpustakaan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerpustakaanResponse _$PerpustakaanResponseFromJson(
        Map<String, dynamic> json) =>
    PerpustakaanResponse(
      perpustakaanList: (json['result'] as List<dynamic>)
          .map((e) => PerpustakaanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PerpustakaanResponseToJson(
        PerpustakaanResponse instance) =>
    <String, dynamic>{
      'result': instance.perpustakaanList,
    };

PerpustakaanModel _$PerpustakaanModelFromJson(Map<String, dynamic> json) =>
    PerpustakaanModel(
      idBukuFisik: json['id_buku_fisik'] as String?,
      judul: json['judul'] as String?,
      sinopsis: json['sinopsis'] as String?,
      penulis: json['penulis'] as String?,
      penerbit: json['penerbit'] as String?,
      kodeKategori: json['kd_kategori'] as String?,
      namaKategori: json['nama_kategori'] as String?,
      halaman: json['halaman'] as String?,
      cover: json['cover'] as String?,
      stokBuku: json['stok_buku'] as String?,
    );

Map<String, dynamic> _$PerpustakaanModelToJson(PerpustakaanModel instance) =>
    <String, dynamic>{
      'id_buku_fisik': instance.idBukuFisik,
      'judul': instance.judul,
      'sinopsis': instance.sinopsis,
      'penulis': instance.penulis,
      'penerbit': instance.penerbit,
      'kd_kategori': instance.kodeKategori,
      'nama_kategori': instance.namaKategori,
      'halaman': instance.halaman,
      'cover': instance.cover,
      'stok_buku': instance.stokBuku,
    };
