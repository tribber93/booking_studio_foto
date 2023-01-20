import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyController extends GetxController {
  //TODO: Implement DetailPaketController
  var db = FirebaseFirestore.instance;
  String tanggal =
      DateFormat("EEEE, d MMM yyyy", "id_ID").format(DateTime.now());

  bool isChecked = false;
  var tabIndex = 0;
  var count = 1.obs;
  RxInt total = 0.obs;
  DateTime tanggalSekarang = DateTime.now();
  String? jam;
  late String jamTerpilih;
  late String tanggalTerpilih;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController extraController;

  @override
  void onInit() {
    super.onInit();
    extraController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
    // update();
    return waktu['isBooked'] == true || hasil == true && comparison < 0
        ? null
        : () {
            jam = '${waktu['jam']}';
            update();
            tanggalTerpilih = DateFormat('dd MMM yyyy').format(dateTime);
            jamTerpilih = waktu['jam'];
            print(
                'dari tanggal terpilih $tanggalTerpilih'); // Output: "29 Dec 2021 12:00:00" // Output: "29 Dec 2021 12:00:00"
            print(
                'dari tanggal addDate ${addDate(1)}'); // Output: "29 Dec 2021 12:00:00" // Output: "29 Dec 2021 12:00:00"

            print(jamTerpilih);
          };
  }

  addDate(int tambah) {
    var add = DateTime(tanggalSekarang.year, tanggalSekarang.month,
        tanggalSekarang.day + tambah);
    String formated = DateFormat('dd MMM yyyy').format(add);
    return formated;
  }
}
