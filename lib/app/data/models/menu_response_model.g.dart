// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) => MenuResponse(
      idMenuLayanan: json['id_menu_layanan'] as String?,
      kdMenuAkses: json['kd_menu_akses'] as String?,
      layanan: json['layanan'] as String?,
      idMenu: json['id_menu'] as String?,
      namaMenu: json['nama_menu'] as String?,
      deskripsiMenu: json['deskripsi_menu'] as String?,
      tagMenu: json['tag_menu'] as String?,
      hakAkses: json['hak_akses'] as String?,
      iconMenu: json['icon_menu'] as String?,
      tglPostingMenu: json['tgl_posting_menu'] as String?,
      statusAktifMenu: json['status_aktif_menu'] as String?,
    );

Map<String, dynamic> _$MenuResponseToJson(MenuResponse instance) =>
    <String, dynamic>{
      'id_menu_layanan': instance.idMenuLayanan,
      'kd_menu_akses': instance.kdMenuAkses,
      'layanan': instance.layanan,
      'id_menu': instance.idMenu,
      'nama_menu': instance.namaMenu,
      'deskripsi_menu': instance.deskripsiMenu,
      'tag_menu': instance.tagMenu,
      'hak_akses': instance.hakAkses,
      'icon_menu': instance.iconMenu,
      'tgl_posting_menu': instance.tglPostingMenu,
      'status_aktif_menu': instance.statusAktifMenu,
    };
