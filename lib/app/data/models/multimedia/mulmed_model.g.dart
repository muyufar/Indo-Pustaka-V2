// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mulmed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MulMedModel _$MulMedModelFromJson(Map<String, dynamic> json) => MulMedModel(
      idMaster: json['id_master'] as String?,
      judul: json['judul'] as String?,
      cover: json['cover'] as String?,
      urlMaster: json['url_master'] as String?,
      gambarUnduh: json['gambar_unduh'] as String?,
      jumlahPembaca: json['jumlah_pembaca'] as int?,
      judulBuku: json['judul_buku'] as String?,
      penulis: json['penulis'] as String?,
      coverBuku: json['cover_buku'] as String?,
      orientasi: json['orientasi'] as String?,
    );

Map<String, dynamic> _$MulMedModelToJson(MulMedModel instance) =>
    <String, dynamic>{
      'id_master': instance.idMaster,
      'judul': instance.judul,
      'cover': instance.cover,
      'url_master': instance.urlMaster,
      'gambar_unduh': instance.gambarUnduh,
      'jumlah_pembaca': instance.jumlahPembaca,
      'judul_buku': instance.judulBuku,
      'penulis': instance.penulis,
      'cover_buku': instance.coverBuku,
      'orientasi': instance.orientasi,
    };
