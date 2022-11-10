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
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_login.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: null,
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 20,
            ),
            width: double.infinity,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Let's Start",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Abadikan Moment Anda \nBersama Kami",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.DASHBOARD);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                              ),
                              Text(
                                "Masuk dengan Gmail",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
