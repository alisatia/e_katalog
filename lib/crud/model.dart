class Produk {
  final String id;
  final String nama;
  final String harga;
  final String deskripsi;
  final String gambar;

  const Produk({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
    );
  }
}
