import 'package:json_annotation/json_annotation.dart';

part 'bookmark_response_model.g.dart';

@JsonSerializable()
class BookmarkResponseModel {
  String? idBuku;
  String? judul;
  String? sinopsis;
  String? penulis;
  String? penerbit;
  @JsonKey(name: 'nama_kategori')
  String? namaKategori;
  String? halaman;
  String? cover;
  @JsonKey(name: 'pdf_url')
  String? pdfUrl;
  @JsonKey(name: 'status_file')
  String? statusFile;

  BookmarkResponseModel({
    this.idBuku,
    this.judul,
    this.sinopsis,
    this.penulis,
    this.penerbit,
    this.namaKategori,
    this.halaman,
    this.cover,
    this.pdfUrl,
    this.statusFile,
  });

  factory BookmarkResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkResponseModelToJson(this);
}
