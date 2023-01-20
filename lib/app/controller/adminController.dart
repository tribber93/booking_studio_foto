import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AdminController extends GetxController {
  var db = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController tanggalController, jamController;

  @override
  void onInit() {
    super.onInit();
    tanggalController = TextEditingController();
    jamController = TextEditingController();
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
