import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/widgetLoginSignup.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    Color smallText = Colors.grey.shade600;
    return Scaffold(
      body: BgLoginSignup(
          isi: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
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
                      text: "Abadikan Moment Anda Bersama Kami",
                      style: TextStyle(fontSize: 14, color: smallText))
                ]),
          ),
          const SizedBox(
            height: 40,
          ),
          const MyTextField(
            hint: "Username",
          ),
          const MyTextField(
            hint: "Password",
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 60,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.grey.shade800)),
                  onPressed: () {
                    Get.toNamed(Routes.ADMIN_DASHBOARD);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Login"),
                    ],
                  )),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text("Belum punya akun?", style: TextStyle(color: smallText)),
          //       TextButton(
          //           onPressed: () {
          //             Get.toNamed(Routes.SIGNUP);
          //           },
          //           child: Text(
          //             "Daftar",
          //             style: TextStyle(color: Colors.grey.shade900),
          //           ))
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: Divider(
                    color: Colors.black,
                  )),
            ),
            Text(
              "atau masuk dengan",
              style: TextStyle(color: smallText),
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: Divider(
                    color: Colors.black,
                  )),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () => authC.signInWithGoogle(),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/images/google.png"),
                            Text(
                              "Masuk dengan Google",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.white)),
                      onPressed: () {
                        Get.offAllNamed(Routes.DASHBOARD);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "Masuk sebagai Tamu",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
