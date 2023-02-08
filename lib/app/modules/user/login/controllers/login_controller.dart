import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void increment() => count.value++;

  void submit(var formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((user) {
          Get.offAllNamed(Routes.ADMIN_DASHBOARD);
        });
      } catch (e) {
        print(e);
      }
    }
  }
}
