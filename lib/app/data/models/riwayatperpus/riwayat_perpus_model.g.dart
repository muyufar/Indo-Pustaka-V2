// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_perpus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiwayatPerpusResponse _$RiwayatPerpusResponseFromJson(
        Map<String, dynamic> json) =>
    RiwayatPerpusResponse(
      riwayatPerpusList: (json['result'] as List<dynamic>)
          .map((e) => RiwayatPerpus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RiwayatPerpusResponseToJson(
        RiwayatPerpusResponse instance) =>
    <String, dynamic>{
      'result': instance.riwayatPerpusList,
    };

RiwayatPerpus _$RiwayatPerpusFromJson(Map<String, dynamic> json) =>
    RiwayatPerpus(
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

Map<String, dynamic> _$RiwayatPerpusToJson(RiwayatPerpus instance) =>
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
