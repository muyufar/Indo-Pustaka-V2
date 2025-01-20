import 'package:json_annotation/json_annotation.dart';

part 'buku_detail_model.g.dart';

@JsonSerializable()
class BukuDetail {
  String? tag;
  String? jenjang;
  @JsonKey(name: 'id_buku')
  String? idBuku;
  @JsonKey(name: 'id_sekolah')
  String? idSekolah;
  @JsonKey(name: 'id_user')
  String? idUser;

  BukuDetail({
    this.tag,
    this.jenjang,
    this.idBuku,
    this.idSekolah,
    this.idUser,
  });

  factory BukuDetail.fromJson(Map<String, dynamic> json) =>
      _$BukuDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BukuDetailToJson(this);
}
