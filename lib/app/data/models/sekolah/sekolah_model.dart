import 'package:json_annotation/json_annotation.dart';

part 'sekolah_model.g.dart';

@JsonSerializable()
class Sekolah {
  @JsonKey(name: 'id_sekolah')
  String? idSekolah;

  Sekolah({this.idSekolah});

  factory Sekolah.fromJson(Map<String, dynamic> json) =>
      _$SekolahFromJson(json);

  Map<String, dynamic> toJson() => _$SekolahToJson(this);
}
