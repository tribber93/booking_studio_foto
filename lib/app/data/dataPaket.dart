List paket = [
  {
    "nama": "Self Photo",
    "image": [
      "assets/images/paket/solo1.jpg",
      "assets/images/paket/solo2.jpg",
      "assets/images/paket/solo3.jpg",
    ],
    "harga": 100000,
    "durasi": 25,
    "maks": "1-2",
    "cetak": 2,
    "soft file": 25,
    "icon": "assets/images/self-photo.png",
    "tambahan": [
      {"extra": "+orang", "harga": 15000, "isCheck": false},
      {"extra": "+cetak", "harga": 10000, "isCheck": false},
      {"extra": "Extra 50 file foto", "harga": 35000, "isCheck": false},
      {"extra": "Extra 100 file foto", "harga": 55000, "isCheck": false},
      {"extra": "Extra 150 file foto", "harga": 75000, "isCheck": false},
      {"extra": "Extra 200 file foto", "harga": 100000, "isCheck": false},
    ]
  },
  {
    "nama": "Pasfoto",
    "image": [
      "assets/images/paket/pasfoto3.jpg",
      "assets/images/paket/pasfoto1.jpg",
      "assets/images/paket/pasfoto2.jpeg"
    ],
    "harga": 30000,
    "durasi": 10,
    "maks": "1",
    "cetak": 10,
    "soft file": 1,
    "icon": "assets/icons/pasfoto.png",
    "tambahan": [
      {"extra": "1 softfile edit", "harga": 10000, "isCheck": false},
      {"extra": "Ganti background", "harga": 10000, "isCheck": false},
      {"extra": "Ganti Baju", "harga": 10000, "isCheck": false},
      {"extra": "Tambah cetak 2x3 + laminasi", "harga": 3000, "isCheck": false},
      {"extra": "Tambah cetak 4x6 + laminasi", "harga": 3000, "isCheck": false},
      {"extra": "Tambah cetak 3x4 + laminasi", "harga": 3000, "isCheck": false},
    ]
  },
  {
    "nama": "Wedding",
    "image": [
      "assets/images/paket/wed1.jpg",
      "assets/images/paket/wed2.jpg",
      "assets/images/paket/wed3.jpg",
    ],
    "harga": 30000,
    "durasi": 10,
    "maks": "1",
    "soft file": 1,
    "cetak": 10,
    "icon": "assets/images/prewedding.png"
  },
  {
    "nama": "Group",
    "image": [
      "assets/images/paket/group1.jpg",
      "assets/images/paket/group3.jpg",
      "assets/images/paket/group2.jpg",
    ],
    "harga": 150000,
    "durasi": 30,
    "maks": "1-5",
    "soft file": 35,
    "cetak": 5,
    "icon": "assets/images/prewedding.png"
  },
  {
    "nama": "Graduate",
    "image": [
      "assets/images/paket/grad3.jpg",
      "assets/images/paket/grad2.jpg",
      "assets/images/paket/grad1.jpg",
    ],
    "maks": 1,
    "icon": "assets/images/graduate.png"
  },
  {
    "nama": "Keluarga",
    "image": [
      "assets/images/paket/fam2.jpg",
      "assets/images/paket/fam3.jpg",
      "assets/images/paket/fam1.jpg",
    ],
    "maks": 5,
    "icon": "assets/images/family.png"
  },
  {
    "nama": "Couple",
    "image": [
      "assets/images/paket/couple3.jpg",
      "assets/images/paket/couple1.jpg",
      "assets/images/paket/couple2.jpg",
    ],
    "maks": 2,
    "icon": "assets/images/couple.png"
  },
];

// mengambil data dari bawah(tiket terbaru)
List paketReversed = paket.reversed.toList();
