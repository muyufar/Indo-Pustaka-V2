// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siswa_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiswaResponse _$SiswaResponseFromJson(Map<String, dynamic> json) =>
    SiswaResponse(
      usernameSiswa: json['username_siswa'] as String?,
      kdSekolah: json['kd_sekolah'] as String?,
      namaSiswa: json['nama_siswa'] as String?,
      teleponSiswa: json['telepon_siswa'] as String?,
      emailSiswa: json['email_siswa'] as String?,
      passwordSiswa: json['password_siswa'] as String?,
      waktuLogin: json['waktulogin'] as String?,
      waktuLogout: json['waktulogout'] as String?,
      postingDataSiswa: json['posting_data_siswa'] as String?,
      updateDataSiswa: json['update_data_siswa'] as String?,
      statusKeanggotaan: json['status_keanggotaan'] as String?,
      statusRmvSiswa: json['status_rmv_siswa'] as String?,
      typeDivace: json['type_divace'] as String?,
      idKelaspeserta: json['id_kelaspeserta'] as String?,
      idKelas: json['id_kelas'] as String?,
      statusRmvKelaspeserta: json['status_rmv_kelaspeserta'] as String?,
      idSekolah: json['id_sekolah'] as String?,
      namaSekolah: json['nama_sekolah'] as String?,
      jenjangSekolah: json['jenjang_sekolah'] as String?,
      jenjangElearning: json['jenjang_elearning'] as String?,
      limitSiswa: json['limit_siswa'] as String?,
      limitPengumuman: json['limit_pengumuman'] as String?,
      limitTanggal: json['limit_tanggal'] as String?,
      tglInput: json['tgl_input'] as String?,
      layanan: json['layanan'] as String?,
    );

Map<String, dynamic> _$SiswaResponseToJson(SiswaResponse instance) =>
    <String, dynamic>{
      'username_siswa': instance.usernameSiswa,
      'kd_sekolah': instance.kdSekolah,
      'nama_siswa': instance.namaSiswa,
      'telepon_siswa': instance.teleponSiswa,
      'email_siswa': instance.emailSiswa,
      'password_siswa': instance.passwordSiswa,
      'waktulogin': instance.waktuLogin,
      'waktulogout': instance.waktuLogout,
      'posting_data_siswa': instance.postingDataSiswa,
      'update_data_siswa': instance.updateDataSiswa,
      'status_keanggotaan': instance.statusKeanggotaan,
      'status_rmv_siswa': instance.statusRmvSiswa,
      'type_divace': instance.typeDivace,
      'id_kelaspeserta': instance.idKelaspeserta,
      'id_kelas': instance.idKelas,
      'status_rmv_kelaspeserta': instance.statusRmvKelaspeserta,
      'id_sekolah': instance.idSekolah,
      'nama_sekolah': instance.namaSekolah,
      'jenjang_sekolah': instance.jenjangSekolah,
      'jenjang_elearning': instance.jenjangElearning,
      'limit_siswa': instance.limitSiswa,
      'limit_pengumuman': instance.limitPengumuman,
      'limit_tanggal': instance.limitTanggal,
      'tgl_input': instance.tglInput,
      'layanan': instance.layanan,
    };
