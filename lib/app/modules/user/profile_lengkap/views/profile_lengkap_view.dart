import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studio_foto/utils/myColor.dart';

import '../controllers/profile_lengkap_controller.dart';

class ProfileLengkapView extends GetView<ProfileLengkapController> {
  const ProfileLengkapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Profile Lengkap'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/02/08/3489974160.png"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('✏️ Ubah Foto')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ProfileInfo(
                      title: "Nama Lengkap",
                      isi: "Yoni Tribber",
                    ),
                    ProfileInfo(
                      title: "E-mail",
                      isi: "tribberyoni5@gmail.com",
                    ),
                    ProfileInfo(
                      title: "No. Hp",
                      isi: "+62 858 6457 1300",
                    ),
                    ProfileInfo(
                      title: "Tanggal dibuat",
                      isi: "10 November 2022",
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.bottomSheet(Container(
                            height: Get.height,
                            color: Colors.white,
                            child: Center(
                              child: Text("Edit Data Diri"),
                            ),
                          ));
                        },
                        child: Text("Ubah info data diri"))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ProfileInfo extends StatelessWidget {
  String title;
  String isi;

  ProfileInfo({
    Key? key,
    required this.title,
    required this.isi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            isi,
            style: TextStyle(fontSize: 16),
          )),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
