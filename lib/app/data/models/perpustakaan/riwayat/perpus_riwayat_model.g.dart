// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perpus_riwayat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerpusRiwayatResponse _$PerpusRiwayatResponseFromJson(
        Map<String, dynamic> json) =>
    PerpusRiwayatResponse(
      perpusRiwayatList: (json['result'] as List<dynamic>)
          .map((e) => PerpusRiwayatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PerpusRiwayatResponseToJson(
        PerpusRiwayatResponse instance) =>
    <String, dynamic>{
      'result': instance.perpusRiwayatList,
    };

PerpusRiwayatModel _$PerpusRiwayatModelFromJson(Map<String, dynamic> json) =>
    PerpusRiwayatModel(
      idPeminjamanModel: json['id_peminjaman_model'] as String?,
      kodePinjamFisik: json['kode_pinjam_fisik'] as String?,
      idBukuFisik: json['id_buku_fisik'] as String?,
      judul: json['judul'] as String?,
      penulis: json['penulis'] as String?,
      penerbit: json['penerbit'] as String?,
      statusPeminjamanFisik: json['status_peminjaman_fisik'] as String?,
      tanggalPeminjamanFisik: json['tanggal_peminjaman_fisik'] as String?,
      tanggalExpPeminjamanFisik:
          json['tanggal_exp_peminjaman_fisik'] as String?,
      jumlahPeminjamanFisik: json['jumlah_peminjaman_fisik'] as String?,
      cover: json['cover'] as String?,
    );

Map<String, dynamic> _$PerpusRiwayatModelToJson(PerpusRiwayatModel instance) =>
    <String, dynamic>{
      'id_peminjaman_model': instance.idPeminjamanModel,
      'kode_pinjam_fisik': instance.kodePinjamFisik,
      'id_buku_fisik': instance.idBukuFisik,
      'judul': instance.judul,
      'penulis': instance.penulis,
      'penerbit': instance.penerbit,
      'status_peminjaman_fisik': instance.statusPeminjamanFisik,
      'tanggal_peminjaman_fisik': instance.tanggalPeminjamanFisik,
      'tanggal_exp_peminjaman_fisik': instance.tanggalExpPeminjamanFisik,
      'jumlah_peminjaman_fisik': instance.jumlahPeminjamanFisik,
      'cover': instance.cover,
    };
