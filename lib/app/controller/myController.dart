import 'dart:async';
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
  List<bool> isChecks = [];
  List<int> counts = [];
  bool isChecked = false;
  var tabIndex = 0;
  var count = 1.obs;
  int total = 0;
  DateTime tanggalSekarang = DateTime.now();
  String? jam;
  String jamTerpilih = '';
  String tanggalTerpilih = '';
  int age = 1;
  Timer? timer;
  bool longPressCanceled = false;
  int jumlahOrang = 0;
  // String? idJadwal;

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
    count += 1;
    update();
  }

  void decrement() {
    count > 0 ? count -= 1 : 0;
    update();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  reset() {
    jam = null;
    jamTerpilih = '';
    tanggalTerpilih = '';
    tabIndex = 0;
    count = 0.obs;
    isChecks = [];
    counts = [];
    // idJadwal = null;
    update();
  }

  void cancelIncrease() {
    timer!.cancel();
    update();
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

  getPaket() {
    return db.collection('paket').snapshots();
  }

  void checkbox(bool? value, int index, List info) {
    info[index]["isCheck"] = value;
    // addTotal(info, index);
    update();
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

// Merubah DateTime ke string dengan format yang ditentukan

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
            tanggalTerpilih =
                DateFormat('EEEE, d MMM yyyy', "id_ID").format(dateTime);
            jamTerpilih = waktu['jam'];
          };
  }

  addDate(int tambah) {
    var add = DateTime(tanggalSekarang.year, tanggalSekarang.month,
        tanggalSekarang.day + tambah);
    String formated = DateFormat('EEEE, d MMM yyyy', 'id_ID').format(add);
    return formated;
  }

  sendTransaksi(
      {String? namaPemesan,
      String? nama,
      String? user,
      String? email,
      String? phoneNumber,
      List? extraCek,
      List? extraCounter,
      int? jumlahOrang,
      int? hargaPaket}) {
    db.collection("usersTransaction").doc(DateTime.now().toString()).set({
      "timestamp": DateTime.now(),
      "namaPemesan": namaPemesan,
      "harga": hargaPaket,
      "userEmail": email,
      "user": user,
      "tanggal": tanggalTerpilih,
      "jam": jamTerpilih,
      "nama": nama,
      "total": total,
      "sukses": false,
      "batal": false,
      "extraCek": extraCek,
      "extraCounter": extraCounter,
      "jumlahOrang": jumlahOrang,
      "phoneNumber": phoneNumber,
    }).then((value) {
      List waktuBaru = [];
      db
          .collection("jadwal")
          .doc(tanggalTerpilih)
          .snapshots()
          .forEach((element) {
        waktuBaru = element['waktu'];

        for (var waktu in waktuBaru) {
          if (waktu['jam'] == jamTerpilih) {
            waktu['isBooked'] = true;
          }
        }
        db.collection("jadwal").doc(tanggalTerpilih).update({
          'waktu': waktuBaru,
        });
        reset();
      });
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamTransaksi(String? user) {
    return db
        .collection('usersTransaction')
        .where('userEmail', isEqualTo: user)
        // .orderBy('timeStamp', descending: true)
        .snapshots();
    // .then((value) => value.docs.forEach((element) {
    //       print(element.data());
    //     }));
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser({String? id}) {
    return db.collection('users').doc(id).snapshots();
  }
}
