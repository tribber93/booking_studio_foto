import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/main.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/myThemeData.dart';

class ProfileView extends GetView {
  final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Profil Saya'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: context.isPhone ? Colors.amber : Colors.blue,
                  height: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: context.isPhone
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/icons/userProfile.png"),
                      ),
                      const SizedBox(
                        height: 80,
                        child: VerticalDivider(
                          thickness: 2,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Bergabung"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "10 November",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                      style: myTextTheme(context).titleLarge,
                      children: [
                        TextSpan(
                            text: 'Yoni\n',
                            style: GoogleFonts.montserrat(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text: 'Tribber',
                            style: TextStyle(
                                fontSize: 32, color: Colors.grey.shade600)),
                      ]),
                ),
                SizedBox(
                  height: 75,
                ),
                ProfileButton(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE_LENGKAP);
                    },
                    icon: Image.asset(
                      "assets/icons/userButton.png",
                      height: 30,
                    ),
                    label: "Profile Lengkap"),
                ProfileButton(
                    onTap: () {
                      Get.toNamed(Routes.TRANSAKSI);
                    },
                    icon: Image.asset(
                      "assets/icons/ticket.png",
                      height: 30,
                    ),
                    label: "Transaksi Saya"),
                ProfileButton(
                    onTap: () {
                      auth.logout();
                    },
                    icon: Image.asset(
                      "assets/icons/logout.png",
                      height: 25,
                    ),
                    label: "Keluar"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  Widget icon;
  String label;
  void Function() onTap;

  ProfileButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: onTap,
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: icon,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  label,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
