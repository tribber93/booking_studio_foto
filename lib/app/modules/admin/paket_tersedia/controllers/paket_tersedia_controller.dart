import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class PaketTersediaController extends GetxController {
  //TODO: Implement PaketTersediaController
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

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

  final count = 0.obs;
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

  deletePaket(
      {required String id,
      required List images,
      required BuildContext context}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: "Yakin?",
      text: "Kamu ingin menghapus paket ini?",
      confirmBtnText: "Ya",
      onConfirmBtnTap: () {
        for (var image in images) {
          storage.refFromURL(image).delete();
        }
        db.collection("paket").doc(id).delete().then(
              (doc) => print("Document deleted"),
              onError: (e) => print("Error updating document $e"),
            );
        Get.back();
      },
    );

    // Get.back;
    // QuickAlert.sx
    // print(id);
    // child(imagePath).delete().then((_) {
    // Gambar berhasil dihapus
    // }).catchError((error) {
    //   // Error saat menghapus gambar
    // });
    // print(id);
    // print(image);
  }

  deleteImage({
    required String url,
    required String id,
    required List images,
    required BuildContext context,
  }) async {
    List newImages = [];
    for (String image in images) {
      image == url ? null : newImages.add(image);
    }

    images.length > 1
        ? QuickAlert.show(
                context: context,
                type: QuickAlertType.confirm,
                onConfirmBtnTap: () async {
                  isUploading.value = true;
                  await storage.refFromURL(url).delete().then(
                        (value) => db.collection("paket").doc(id).update(
                          {
                            'foto': newImages,
                          },
                        ),
                      );
                  Get.back();
                },
                text: "Hapus Gambar")
            .whenComplete(() => isUploading.value = false)
        : QuickAlert.show(
            context: context,
            type: QuickAlertType.warning,
            title: "Tidak dapat dihapus",
            text: 'Setidaknya satu paket memiliki satu foto',
          );
  }

  deleteExtras({
    // required String url,
    required String id,
    required List extras,
    required Map dipilih,
    required BuildContext context,
  }) {
    // print(extras);
    List newExtras = [];
    // List newImages = [];
    for (Map extra in extras) {
      extra == dipilih ? null : newExtras.add(extra);
    }
    print(newExtras);

    db.collection('paket').doc(id).update({
      'tambahan': newExtras,
    }).whenComplete(() => SnackBar(
          content: const Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ));

    // images.length > 1
    //     ? storage.refFromURL(url).delete().whenComplete(
    //           () => db.collection("paket").doc(id).update({
    //             'foto': newImages,
    //           }),
    //         )
    //     : QuickAlert.show(
    //         context: context,
    //         type: QuickAlertType.warning,
    //         title: "Tidak dapat dihapus",
    //         text: 'Setidaknya satu paket memiliki satu foto',
    //       );
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

  updatePaket({
    required String id,
    required List images,
    required List oldExtras,
  }) async {
    // List newExtras = [];
    // List newImages = [];
    isUploading.value = true;
    imageFile != null ? await uploadImages() : null;
    mapExtras();
    // print(mapExtras());
    // print();
    for (var extra in extras) {
      oldExtras.add(extra);
    }
    for (var url in urlImage) {
      images.add(url);
    }
    // print(oldExtras);

    // print(urlImage);
    db.collection("paket").doc(id).update({
      "nama": namaController.text,
      "harga": int.parse(hargaController.text),
      "durasi": int.parse(durasiController.text),
      "max": int.parse(maxController.text),
      "min": minController.text != '' ? int.parse(minController.text) : null,
      "cetak": int.parse(cetakController.text),
      "softfile": int.parse(softfileController.text),
      "keterangan": keteranganController.text,
      "foto": images,
      "tambahan": oldExtras,
    }).whenComplete(() => isUploading.value = false);

    reset();
  }
}
