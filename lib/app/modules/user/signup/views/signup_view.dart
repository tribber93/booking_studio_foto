import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/modules/user/login/views/login_view.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/widgetLoginSignup.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color smallText = Colors.grey.shade600;
    return Scaffold(
      body: BgLoginSignup(
        isi: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  style: const TextStyle(
                      color: Color.fromARGB(200, 0, 0, 0), fontSize: 42),
                  children: [
                    const TextSpan(
                        text: 'HI!\n',
                        style: TextStyle(fontWeight: FontWeight.w900)),
                    const TextSpan(
                        text: 'Welcome\n',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "Buat akunmu sekarang!",
                        style: TextStyle(fontSize: 14, color: smallText))
                  ]),
            ),
            const SizedBox(
              height: 40,
            ),
            MyTextField(hint: "Nama Lengkap"),
            MyTextField(hint: "No. Handphone"),
            MyTextField(hint: "E-mail"),
            MyTextField(
              hint: "Password",
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.grey.shade800)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Daftar"),
                    ],
                  )),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah punya akun?", style: TextStyle(color: smallText)),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.grey.shade900),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
