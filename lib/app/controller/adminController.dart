import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

class AdminController extends GetxController {
  var db = FirebaseFirestore.instance;
  List<bool> checks = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<File> imageList = [];
  List<String> urlImage = [];
  List<XFile>? imageFile;

  String? idJadwal;
  List<Map> extras = [];
  RxBool isUploading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController tanggalController,
      namaController,
      hargaController,
      durasiController,
      maxController,
      minController,
      cetakController,
      softfileController,
      keteranganController,
      extra1,
      hargaExtra1,
      extra2,
      hargaExtra2,
      extra3,
      hargaExtra3,
      extra4,
      hargaExtra4,
      extra5,
      hargaExtra5;

  @override
  void onInit() {
    super.onInit();
    tanggalController = TextEditingController();
    namaController = TextEditingController();
    hargaController = TextEditingController();
    durasiController = TextEditingController();
    maxController = TextEditingController();
    minController = TextEditingController();
    cetakController = TextEditingController();
    softfileController = TextEditingController();
    keteranganController = TextEditingController();
    extra1 = TextEditingController();
    hargaExtra1 = TextEditingController();
    extra2 = TextEditingController();
    hargaExtra2 = TextEditingController();
    extra3 = TextEditingController();
    hargaExtra3 = TextEditingController();
    extra4 = TextEditingController();
    hargaExtra4 = TextEditingController();
    extra5 = TextEditingController();
    hargaExtra5 = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tanggalController.dispose();
    namaController.dispose();
    hargaController.dispose();
    durasiController.dispose();
    maxController.dispose();
    minController.dispose();
    cetakController.dispose();
    softfileController.dispose();
    keteranganController.dispose();
    extra1.dispose();
    hargaExtra1.dispose();
    extra2.dispose();
    hargaExtra2.dispose();
    extra3.dispose();
    hargaExtra3.dispose();
    extra4.dispose();
    hargaExtra4.dispose();
    extra5.dispose();
    hargaExtra5.dispose();
  }

  void reset() {
    urlImage = [];
    imageList = [];
    extras = [];
    checks = [
      false,
      false,
      false,
      false,
      false,
    ];
    tanggalController.text = "";
    namaController.text = "";
    hargaController.text = "";
    durasiController.text = "";
    maxController.text = "";
    minController.text = "";
    cetakController.text = "";
    softfileController.text = "";
    keteranganController.text = "";
    extra1.text = "";
    hargaExtra1.text = "";
    extra2.text = "";
    hargaExtra2.text = "";
    extra3.text = "";
    hargaExtra3.text = "";
    extra4.text = "";
    hargaExtra4.text = "";
    extra5.text = "";
    hargaExtra5.text = "";
    isUploading.value = false;
    idJadwal = null;
    update();
  }

  Future<bool> checkIfDocExists(String? docId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = db.collection('jadwal');

      var doc = await collectionRef.doc(docId).get();
      // debugPrint("id --> ${doc}" + doc.exists.toString());
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }

  konversiJadwal() {
    String tanggal = tanggalController.text;
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(tanggal);
    DateTime inputDate = DateTime.parse(parseDate.toString());
    DateFormat idFormat = DateFormat("EEEE, d MMM yyyy", "id_ID");
    DateFormat hariFormat = DateFormat("EEEE", "id_ID");
    DateFormat tanggalFormat = DateFormat("d MMM", "id_ID");
    String idDate = idFormat.format(inputDate);
    String hari = hariFormat.format(inputDate);
    String tgl = tanggalFormat.format(inputDate);
    Timestamp timestamp = Timestamp.fromDate(DateTime.parse(tanggal));
    Map hasil = {
      "id": idDate,
      "hari": hari,
      "tanggal": tgl,
      "timestamp": timestamp
    };
    return hasil;
  }

  Future<void> addJadwal(context) async {
    Map hasil = konversiJadwal();
    if (await checkIfDocExists(hasil["id"])) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Jadwal sudah ada',
      );
      // Get.snackbar(
      //   "Generate Gagal",
      //   "Jadwal sudah ada",
      //   backgroundColor: Colors.red,
      // );
      return;
    }

    db.collection("jadwal").doc(hasil["id"]).set(
      {
        "idJadwal": hasil['id'],
        "timeStamp": hasil['timestamp'],
        "hari": hasil["hari"],
        "tanggal": hasil["tanggal"],
        "waktu": FieldValue.arrayUnion(jadwal),
      },
    ).whenComplete(() => QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Jadwal berhasil ditambahkan',
        ));
  }

  Future getImages() async {
    imageFile = await ImagePicker().pickMultiImage();
    for (int i = 0; i < imageFile!.length; i++) {
      File selectedImage = File(imageFile![i].path);
      imageList.add(selectedImage);
    }
    update();
  }

  Future uploadImages() async {
    for (var i = 0; i < imageList.length; i++) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('Foto Paket/${namaController.text}_${DateTime.now()}.jpg');
      UploadTask uploadTask = storageReference.putFile(imageList[i]);
      final downloadURL = await (await uploadTask.whenComplete(() => null))
          .ref
          .getDownloadURL();
      urlImage.add(downloadURL);
    }
  }

  mapExtras() {
    extra1.text.isNotEmpty && hargaExtra1.text.isNotEmpty
        ? extras.add({
            "extra": extra1.text,
            "harga": int.parse(hargaExtra1.text),
            "isIterable": checks[0]
          })
        : null;
    extra2.text.isNotEmpty && hargaExtra2.text.isNotEmpty
        ? extras.add({
            "extra": extra2.text,
            "harga": int.parse(hargaExtra2.text),
            "isIterable": checks[1]
          })
        : null;
    extra3.text.isNotEmpty && hargaExtra3.text.isNotEmpty
        ? extras.add({
            "extra": extra3.text,
            "harga": int.parse(hargaExtra3.text),
            "isIterable": checks[2]
          })
        : null;
    extra4.text.isNotEmpty && hargaExtra4.text.isNotEmpty
        ? extras.add({
            "extra": extra4.text,
            "harga": int.parse(hargaExtra4.text),
            "isIterable": checks[3]
          })
        : null;
    extra5.text.isNotEmpty && hargaExtra5.text.isNotEmpty
        ? extras.add({
            "extra": extra5.text,
            "harga": int.parse(hargaExtra5.text),
            "isIterable": checks[4]
          })
        : null;
  }

  tambahPaket() async {
    mapExtras();
    isUploading.value = true;

    await uploadImages();
    db.collection("paket").add({
      "nama": namaController.text,
      "harga": int.parse(hargaController.text),
      "durasi": int.parse(durasiController.text),
      "max": int.parse(maxController.text),
      "min": minController.text != '' ? int.parse(minController.text) : null,
      "cetak": int.parse(cetakController.text),
      "softfile": int.parse(softfileController.text),
      "keterangan": keteranganController.text,
      "foto": urlImage,
      "tambahan": extras,
    }).whenComplete(() => isUploading.value = false);

    reset();
  }

  streamPesanan({String? status}) {
    if (status == 'belum bayar') {
      return db
          .collection('usersTransaction')
          .where('batal', isEqualTo: false)
          .where('sukses', isEqualTo: false)
          .snapshots();
    } else if (status == 'sukses') {
      return db
          .collection('usersTransaction')
          .where('sukses', isEqualTo: true)
          .snapshots();
    } else if (status == 'batal') {
      return db
          .collection('usersTransaction')
          .where('batal', isEqualTo: true)
          .snapshots();
    }
    //     .snapshots()
    //     .forEach((element) {
    //   print(element.docs[0]['nama']);
    // });
    // print(tes.data);
  }

  konfirmasiPesanan(String? id) {
    db.collection('usersTransaction').doc(id).update({
      "sukses": true,
    });
  }

  batalkanPesanan({String? id, String? tanggal, String? jam}) {
    List waktu = [];
    db.collection('usersTransaction').doc(id).update({
      "batal": true,
    }).whenComplete(
      () => db.collection('jadwal').doc(tanggal).get().then(
        (value) {
          for (var item in value['waktu']) {
            waktu.add(item);
            if (item['jam'] == jam) {
              item['isBooked'] = false;
            }
          }
          db.collection('jadwal').doc(tanggal).update({
            'waktu': waktu,
          });
          // print(waktu);
        },
      ),
    );
    //db.collection('jadwal').doc(tanggal).snapshots().forEach((element) {
    //     List jadwalJam = element['waktu'];
    //     for (var jam in jadwalJam) {
    //       // print(jam['jam']);
    //       if (jam['jam'] == jam) {
    //         jam['isBooked'] = false;
    //         print(jadwalJam);
    //       }
    //     }
    //   }),
    // );

    // print(tes);
  }
}

List jadwal = [
  {"jam": '10:00', "isBooked": false},
  {"jam": '10:30', "isBooked": false},
  {"jam": '11:00', "isBooked": false},
  {"jam": '11:30', "isBooked": false},
  {"jam": '12:00', "isBooked": false},
  {"jam": '12:30', "isBooked": false},
  {"jam": '13:00', "isBooked": false},
  {"jam": '13:30', "isBooked": false},
  {"jam": '14:00', "isBooked": false},
  {"jam": '14:30', "isBooked": false},
  {"jam": '15:00', "isBooked": false},
  {"jam": '15:30', "isBooked": false},
];
