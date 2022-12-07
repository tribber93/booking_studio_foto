class Paket {
  int? harga, durasi, cetak, softFile;
  String? nama, description, maksimal, icon;
  List? gambar, tambahan;

  Paket({
    this.nama,
    this.harga,
    this.description,
    this.gambar,
    this.durasi,
    this.maksimal,
    this.cetak,
    this.softFile,
    this.icon,
    this.tambahan,
  });
}

List paketClassReversed = paketClass.reversed.toList();

List<Paket> paketClass = [
  Paket(
    nama: "Self Photo",
    gambar: [
      "assets/images/paket/solo1.jpg",
      "assets/images/paket/solo2.jpg",
      "assets/images/paket/solo3.jpg",
    ],
    harga: 100000,
    durasi: 25,
    maksimal: "1-2",
    cetak: 2,
    softFile: 25,
    icon: "assets/images/self-photo.png",
    tambahan: [
      {"extra": "+orang", "harga": 15000, "isCheck": false},
      {"extra": "+cetak", "harga": 10000, "isCheck": false},
      {"extra": "Extra 50 file foto", "harga": 35000, "isCheck": false},
      {"extra": "Extra 100 file foto", "harga": 55000, "isCheck": false},
      {"extra": "Extra 150 file foto", "harga": 75000, "isCheck": false},
      {"extra": "Extra 200 file foto", "harga": 100000, "isCheck": false},
    ],
  ),
  Paket(
    nama: "Pasfoto",
    gambar: [
      "assets/images/paket/pasfoto3.jpg",
      "assets/images/paket/pasfoto1.jpg",
      "assets/images/paket/pasfoto2.jpeg",
    ],
    harga: 30000,
    durasi: 10,
    maksimal: "1",
    cetak: 10,
    softFile: 1,
    icon: "assets/icons/pasfoto.png",
    tambahan: [
      {"extra": "1 softfile edit", "harga": 10000, "isCheck": false},
      {"extra": "Ganti background", "harga": 10000, "isCheck": false},
      {"extra": "Ganti Baju", "harga": 10000, "isCheck": false},
      {"extra": "Tambah cetak 2x3 + laminasi", "harga": 3000, "isCheck": false},
      {"extra": "Tambah cetak 4x6 + laminasi", "harga": 3000, "isCheck": false},
      {"extra": "Tambah cetak 3x4 + laminasi", "harga": 3000, "isCheck": false},
    ],
  ),
  Paket(
    nama: "Outdoor Group",
    gambar: [
      "assets/images/paket/group1.jpg",
      "assets/images/paket/group3.jpg",
      "assets/images/paket/group2.jpeg",
    ],
    harga: 30000,
    durasi: 10,
    maksimal: "1",
    cetak: 1,
    softFile: 4,
    icon: "assets/icons/pasfoto.png",
    tambahan: [
      {"extra": "1 softfile edit", "harga": 10000, "isCheck": false},
      {"extra": "Ganti background", "harga": 10000, "isCheck": false},
      {"extra": "Ganti Baju", "harga": 10000, "isCheck": false},
      {"extra": "Tambah cetak 2x3 + laminasi", "harga": 3000, "isCheck": false},
      {"extra": "Tambah cetak 4x6 + laminasi", "harga": 3000, "isCheck": false},
      {"extra": "Tambah cetak 3x4 + laminasi", "harga": 3000, "isCheck": false},
    ],
  ),
];
