import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminDashboardController extends GetxController {
  //TODO: Implement AdminDashboardController

  final count = 0.obs;
  final storage = FirebaseStorage.instance.ref();
  XFile? imageFile;

  uploadImage() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    File selectedImage = File(imageFile!.path);
    final photos = storage.child("Photos/${imageFile!.name}");
    final uploadTask = photos.putFile(selectedImage);

    return uploadTask;
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
