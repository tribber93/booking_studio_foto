import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/utils/myColor.dart';

import '../controllers/profile_lengkap_controller.dart';

class ProfileLengkapView extends GetView<ProfileLengkapController> {
  ProfileLengkapView({Key? key}) : super(key: key);
  final myCon = Get.find<MyController>();
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          actions: [
            TextButton(
                onPressed: () {
                  Get.bottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      Container(
                        color: Colors.amber,
                        height: Get.height * 0.6,
                      ));
                },
                child: Text(
                  "Ubah Data",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: controller.isUpload
            ? Positioned.fill(
                child: Container(
                  color: Colors.black45,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : StreamBuilder(
                stream: authC.streamUsers(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  Map dataUser =
                      (snapshot.data!.data() as Map<String, dynamic>);
                  DateTime dt = (dataUser['createdAt'] as Timestamp).toDate();
                  String tglDaftar =
                      DateFormat('dd MMMM yyyy', 'id_ID').format(dt);

                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Column(
                          children: [
                            dataUser['photo'] != ""
                                ? CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: CachedNetworkImageProvider(
                                      dataUser['photo'],
                                      errorListener: () => Icon(Icons.error),
                                    ),
                                    child: Align(
                                        alignment: Alignment(1, 1),
                                        child: CircleAvatar(
                                          backgroundColor: primaryColor,
                                          radius: 22,
                                          child: IconButton(
                                            icon: FaIcon(
                                              FontAwesomeIcons.camera,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              controller.isUpload = true;
                                              controller.update();
                                              controller.uploadImage(
                                                  dataUser['photo']);
                                              controller.isUpload = false;
                                              controller.update();
                                            },
                                          ),
                                        )),
                                  )
                                : CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(
                                        'assets/icons/userProfile.png'),
                                    child: Align(
                                        alignment: Alignment(1, 1),
                                        child: CircleAvatar(
                                          backgroundColor: primaryColor,
                                          radius: 22,
                                          child: IconButton(
                                            icon: FaIcon(
                                              FontAwesomeIcons.camera,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              controller.uploadImage(
                                                  dataUser['photo']);
                                            },
                                          ),
                                        )),
                                  ),
                            SizedBox(
                              height: 50,
                            ),
                            ProfileInfo(
                              title: "Nama Lengkap",
                              isi: dataUser['name'],
                            ),
                            ProfileInfo(
                              title: "E-mail",
                              isi: dataUser['email'],
                            ),
                            ProfileInfo(
                              title: "No. Hp",
                              isi: "+62 858 6457 1300",
                            ),
                            ProfileInfo(
                              title: "Tanggal dibuat",
                              isi: tglDaftar,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }));
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
