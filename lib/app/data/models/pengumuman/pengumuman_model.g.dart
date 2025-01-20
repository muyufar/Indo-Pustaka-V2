// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengumuman_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PengumumanModel _$PengumumanModelFromJson(Map<String, dynamic> json) =>
    PengumumanModel(
      filePdf: json['file_pdf'] as String?,
      gambar: json['gambar'] as String?,
      idPengumuman: json['id_pengumuman'] as String?,
      isiPengumuman: json['isi_pengumuman'] as String?,
      judul: json['judul'] as String?,
      tanggalPosting: json['tanggal_posting'] as String?,
      tanggalExp: json['tanggal_exp'] as String?,
    );

Map<String, dynamic> _$PengumumanModelToJson(PengumumanModel instance) =>
    <String, dynamic>{
      'file_pdf': instance.filePdf,
      'gambar': instance.gambar,
      'id_pengumuman': instance.idPengumuman,
      'isi_pengumuman': instance.isiPengumuman,
      'judul': instance.judul,
      'tanggal_posting': instance.tanggalPosting,
      'tanggal_exp': instance.tanggalExp,
    };
