import 'package:json_annotation/json_annotation.dart';

part 'bookmark_model.g.dart';

@JsonSerializable()
class BookmarkModel {
  @JsonKey(name: 'id_buku')
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

  BookmarkModel(
      {this.idBuku,
      this.judul,
      this.sinopsis,
      this.penulis,
      this.penerbit,
      this.namaKategori,
      this.halaman,
      this.cover,
      this.pdfUrl,
      this.statusFile});

  factory BookmarkModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkModelToJson(this);
}
