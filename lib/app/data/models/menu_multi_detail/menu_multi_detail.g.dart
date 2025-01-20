// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_multi_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuMultiDetail _$MenuMultiDetailFromJson(Map<String, dynamic> json) =>
    MenuMultiDetail(
      idMaster: json['id_master'] as String?,
      judul: json['judul'] as String?,
      cover: json['cover'] as String?,
      urlMaster: json['url_master'] as String?,
      gambarUnduh: json['gambar_unduh'] as String?,
      jumlahPembaca: json['jumlah_pembaca'] as int?,
      penulis: json['penulis'] as String?,
      penerbit: json['penerbit'] as String?,
      coverBuku: json['cover_buku'] as String?,
      orientasi: json['orientasi'] as String?,
    );

Map<String, dynamic> _$MenuMultiDetailToJson(MenuMultiDetail instance) =>
    <String, dynamic>{
      'id_master': instance.idMaster,
      'judul': instance.judul,
      'cover': instance.cover,
      'url_master': instance.urlMaster,
      'gambar_unduh': instance.gambarUnduh,
      'jumlah_pembaca': instance.jumlahPembaca,
      'penulis': instance.penulis,
      'penerbit': instance.penerbit,
      'cover_buku': instance.coverBuku,
      'orientasi': instance.orientasi,
    };
