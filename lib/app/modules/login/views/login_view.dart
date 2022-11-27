import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 0.2, 0.8, 1],
            colors: [
              Color.fromARGB(255, 248, 222, 181),
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 248, 222, 181),
            ],
          )),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                color: Color.fromARGB(200, 0, 0, 0),
                                fontSize: 42),
                            children: [
                              const TextSpan(
                                  text: 'HI!\n',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w900)),
                              const TextSpan(
                                  text: 'Welcome\n',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: "Abadikan Moment Anda Bersama Kami",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700))
                            ]),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 248, 222, 181),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            hintText: 'Username'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 248, 222, 181),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            hintText: 'Password'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color.fromARGB(255, 229, 177, 92))),
                            onPressed: () {
                              Get.offAllNamed(Routes.DASHBOARD);
                            },
                            child: Text("Login")),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Belum punya akun?"),
                            TextButton(onPressed: () {}, child: Text("Daftar"))
                          ],
                        ),
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Divider(
                                color: Colors.black,
                              )),
                        ),
                        Text("atau masuk dengan"),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                              )),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white)),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white)),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset("assets/images/fb.png"),
                                      Text(
                                        "Masuk dengan Facebook",
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
