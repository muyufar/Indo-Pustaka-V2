class BookmarkPost {
  String? tAG;
  String? idUser;
  String? idBuku;
  String? idSekolah;

  BookmarkPost({this.tAG, this.idUser, this.idBuku, this.idSekolah});

  BookmarkPost.fromJson(Map<String, dynamic> json) {
    tAG = json['TAG'];
    idUser = json['id_user'];
    idBuku = json['id_buku'];
    idSekolah = json['id_sekolah'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['TAG'] = tAG;
    data['id_user'] = idUser;
    data['id_buku'] = idBuku;
    data['id_sekolah'] = idSekolah;
    return data;
  }
}
