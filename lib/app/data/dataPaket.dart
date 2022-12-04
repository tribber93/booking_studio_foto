List paket = [
  {
    "nama": "Self Photo",
    "image": [
      "assets/images/paket/solo1.jpg",
      "assets/images/paket/solo2.jpg",
      "assets/images/paket/solo3.jpg"
    ],
    "harga": 100000,
    "durasi": 15,
    "maks": "1-2",
    "cetak": 2,
    "soft file": 25,
    "icon": "assets/images/self-photo.png"
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
