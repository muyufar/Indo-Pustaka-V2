import 'package:json_annotation/json_annotation.dart';

part 'sekolah_resp_model.g.dart';

@JsonSerializable()
class SekolahResponse {
  @JsonKey(name: 'notelp_admin')
  String? noTelpAdmin;
  @JsonKey(name: 'nama_sekolah')
  String? namaSekolah;

  SekolahResponse({this.noTelpAdmin, this.namaSekolah});

  factory SekolahResponse.fromJson(Map<String, dynamic> json) =>
      _$SekolahResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SekolahResponseToJson(this);
}
