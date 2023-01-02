import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyController extends GetxController {
  //TODO: Implement DetailPaketController
  var db = FirebaseFirestore.instance;
  var tanggal = DateFormat("EEEE, d MMM yyyy", "id_ID").format(DateTime.now());

  bool isChecked = false;
  var tabIndex = 0;
  var count = 1.obs;
  RxInt total = 0.obs;
  DateTime tanggalSekarang = DateTime.now();
  String? jam;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController tanggalController, jamController, extraController;

  @override
  void onInit() {
    super.onInit();
    tanggalController = TextEditingController();
    jamController = TextEditingController();
    extraController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tanggalController.dispose();
    jamController.dispose();
    extraController.dispose();
  }

  void increment() {
    count += 3;
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void checkbox(bool? value, int index, List info) {
    info[index]["isCheck"] = value;
    addTotal(info, index);
    update();
  }

  void addTotal(info, int index) {
    // int harga = info[index]["harga"];
    // if (info[index]["isCheck"] == true) {
    //   total = total + harga;
    // } else {
    //   total = total - harga;
    // }
  }

  addUser() async {
    // var userId = DateTime.now().toIso8601String();
    final user = <String, dynamic>{
      "first": "Isaura",
      "last": "Anindia",
      "born": 2011
    };
    await db
        .collection("users")
        .add(user)
        .whenComplete(() => Get.snackbar("Berhasil", "Pesan Berhasil dikirim"));
  }

  Future<void> addJadwal({
    String? docId,
    Timestamp? ts,
    String? hari,
    String? tgl,
  }) async {
    if (await checkIfDocExists(docId)) {
      Get.snackbar(
        "Generate Gagal",
        "Jadwal sudah ada",
        backgroundColor: Colors.red,
      );
      return;
    }

    db.collection("jadwal").doc(docId).set({
      "timeStamp": ts,
      "hari": hari,
      "tanggal": tgl,
      "waktu": FieldValue.arrayUnion(jadwal),
    }).whenComplete(() => Get.snackbar("Berhasil", "Jadwal sudah digenerate",
        backgroundColor: Colors.green));
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

  Stream<QuerySnapshot> streamJadwal() {
    return db
        .collection('jadwal')
        .where(
          'timeStamp',
          isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(
              tanggalSekarang.year,
              tanggalSekarang.month,
              tanggalSekarang.day)),
        )
        .snapshots();
  }

  radioButton(val, i, selected, info) {
    debugPrint('Button: $val index: $i $selected');
    debugPrint(info.harga.toString());
    return val;
    // jamController = val;
  }

  checkWaktu(Map waktu, Timestamp data) {
    final timestampInMilliseconds = data.millisecondsSinceEpoch;

// Membuat objek DateTime dari timestamp
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestampInMilliseconds);

// Menentukan format tanggal dan waktu
    final dateFormat = DateFormat('dd MMM yyyy HH:mm:ss');

// Merubah DateTime ke string dengan format yang ditentukan
    final formattedDateTime = dateFormat.format(dateTime);

    var format = DateFormat("HH:mm");
    var sekarang = format.format(DateTime.now());
    var jamdb = format.parse(waktu["jam"]);
    bool hasil = jamdb.isBefore(format.parse(sekarang)) ? true : false;
    var comparison = data.compareTo(Timestamp.fromDate(DateTime.now()));
    return waktu['isBooked'] == true || hasil == true && comparison < 0
        ? null
        : () {
            jam = '${waktu['jam']}';
            update();
            // print(data);
            print(formattedDateTime); // Output: "29 Dec 2021 12:00:00"
          };
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
