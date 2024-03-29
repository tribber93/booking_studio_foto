import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/myThemeData.dart';

class ProfileView extends GetView {
  final authC = Get.find<AuthController>();

  ProfileView({super.key});
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
          child: authC.auth.currentUser == null
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kamu Belum Login",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Text("Yuk Login dulu!"),
                      const SizedBox(
                        height: 30,
                      ),
                      const Image(
                          height: 300,
                          image: AssetImage("assets/images/log-in.png")),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () => Get.offAllNamed(Routes.LOGIN),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          constraints: const BoxConstraints(maxWidth: 200),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 1),
                                    spreadRadius: 0.0001,
                                    blurRadius: 0.3)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.arrow_back),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Ke halaman Login')
                            ],
                          ),
                        ),
                      )
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.white),
                      //     onPressed: () {
                      //       Get.offAllNamed(Routes.LOGIN);
                      //     },
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 8, vertical: 13),
                      //       child: Text(
                      //         "Ke halaman Login",
                      //         style: TextStyle(color: Colors.black87),
                      //       ),
                      //     )),
                    ],
                  ),
                )
              : StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: authC.streamUsers(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    Map dataUser =
                        (snapshot.data!.data() as Map<String, dynamic>);
                    List nama = dataUser['name'].split(" ");
                    DateTime dt = (dataUser['createdAt'] as Timestamp).toDate();
                    String tglDaftar =
                        DateFormat('dd MMMM yyyy', 'id_ID').format(dt);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            // color: context.isPhone ? Colors.amber : Colors.blue,
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: context.isPhone
                                  ? MainAxisAlignment.spaceBetween
                                  : MainAxisAlignment.spaceEvenly,
                              children: [
                                dataUser["photo"] == ''
                                    ? const CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                            "assets/icons/userProfile.png"),
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          dataUser['photo'],
                                          errorListener: () =>
                                              const Icon(Icons.error),
                                        ),
                                        // NetworkImage(dataUser['photo']),
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const SizedBox(
                                  height: 80,
                                  child: VerticalDivider(
                                    thickness: 2,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Bergabung",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        tglDaftar,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                style: myTextTheme(context).titleLarge,
                                children: [
                                  TextSpan(
                                      text: '${nama[0]}\n',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: nama[1] ?? '',
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.grey.shade600)),
                                ]),
                          ),
                          const SizedBox(
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
                              onTap: () => Get.toNamed(Routes.TRANSAKSI),
                              icon: Image.asset(
                                "assets/icons/ticket.png",
                                height: 30,
                              ),
                              label: "Transaksi Saya"),
                          ProfileButton(
                              onTap: () {
                                authC.logout();
                              },
                              icon: Image.asset(
                                "assets/icons/logout.png",
                                height: 25,
                              ),
                              label: "Keluar"),
                        ],
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final Map dataUser;
  final String tglDaftar;

  ScreenArguments(this.dataUser, this.tglDaftar);
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
        SizedBox(
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
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
