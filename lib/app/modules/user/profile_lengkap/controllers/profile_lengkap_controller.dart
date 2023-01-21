import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileLengkapController extends GetxController {
  //TODO: Implement ProfileLengkapController

  final count = 0.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance.ref();
  XFile? imageFile;
  RxBool isUpload = false.obs;

  void uploadImage(String url) async {
    isUpload.value = true;
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile == null) {
      isUpload.value = false;
      return;
    }
    File selectedImage = File(imageFile!.path);
    final photos = storage.child(
        "Photos/${auth.currentUser!.displayName.toString() + '_' + imageFile!.name}");
    final uploadTask = photos.putFile(selectedImage);
    final downloadUrl =
        await (await uploadTask.whenComplete(() => isUpload.value = false))
            .ref
            .getDownloadURL();

    if (url != '') {
      final hapusImage = FirebaseStorage.instance.refFromURL(url).delete();
      hapusImage;
    }

    db.collection('users').doc(auth.currentUser!.email).update({
      "photo": downloadUrl,
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
