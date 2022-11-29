import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/myColor.dart';

class ProfileView extends GetView {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Profil Saya'),
        centerTitle: true,
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
                        backgroundImage: NetworkImage(
                            "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/02/08/3489974160.png"),
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
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        TextSpan(
                            text: 'Yoni\n',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Tribber',
                            style: TextStyle(
                              fontSize: 32,
                            )),
                      ]),
                ),
                SizedBox(
                  height: 75,
                ),
                ProfileButton(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE_LENGKAP);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.user,
                      size: 30,
                    ),
                    label: "Profile Lengkap"),
                ProfileButton(
                    onTap: () {
                      Get.toNamed(Routes.TRANSAKSI);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.receipt,
                      size: 30,
                    ),
                    label: "Transaksi Saya"),
                ProfileButton(
                    onTap: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      size: 30,
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
