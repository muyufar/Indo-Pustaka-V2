// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bukusaya_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BukuSayaResponse _$BukuSayaResponseFromJson(Map<String, dynamic> json) =>
    BukuSayaResponse(
      bukuSayaList: (json['result'] as List<dynamic>)
          .map((e) => BukuSaya.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BukuSayaResponseToJson(BukuSayaResponse instance) =>
    <String, dynamic>{
      'result': instance.bukuSayaList,
    };

BukuSaya _$BukuSayaFromJson(Map<String, dynamic> json) => BukuSaya(
      idPeminjaman: json['id_peminjaman'] as String?,
      kodePinjam: json['kode_pinjam'] as String?,
      idBuku: json['id_buku'] as String?,
      judul: json['judul'] as String?,
      sinopsis: json['sinopsis'] as String?,
      penulis: json['penulis'] as String?,
      penerbit: json['penerbit'] as String?,
      statusPeminjaman: json['status_peminjaman'] as String?,
      tanggalPosting: json['tanggal_posting'] as String?,
      tanggalExpPeminjaman: json['tanggal_exp_peminjaman'] as String?,
      kdKategori: json['kd_kategori'] as String?,
      namaKategori: json['nama_kategori'] as String?,
      halaman: json['halaman'] as String?,
      cover: json['cover'] as String?,
      pdfUrl: json['pdf_url'] as String?,
    );

Map<String, dynamic> _$BukuSayaToJson(BukuSaya instance) => <String, dynamic>{
      'id_peminjaman': instance.idPeminjaman,
      'kode_pinjam': instance.kodePinjam,
      'id_buku': instance.idBuku,
      'judul': instance.judul,
      'sinopsis': instance.sinopsis,
      'penulis': instance.penulis,
      'penerbit': instance.penerbit,
      'status_peminjaman': instance.statusPeminjaman,
      'tanggal_posting': instance.tanggalPosting,
      'tanggal_exp_peminjaman': instance.tanggalExpPeminjaman,
      'kd_kategori': instance.kdKategori,
      'nama_kategori': instance.namaKategori,
      'halaman': instance.halaman,
      'cover': instance.cover,
      'pdf_url': instance.pdfUrl,
    };
