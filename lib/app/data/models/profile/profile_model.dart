import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'id_anggota')
  String? idAnggota;
  String? noHp;
  String? nama;
  // uploadedfile

  Profile({this.idAnggota, this.noHp, this.nama});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
