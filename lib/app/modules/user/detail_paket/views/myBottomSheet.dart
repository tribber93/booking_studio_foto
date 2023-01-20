import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/modules/user/detail_paket/controllers/detail_paket_controller.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/myButtonItem.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/widget/extraWidget.dart';
import 'package:studio_foto/utils/widget/myGroupButton.dart';

class MyBottomSheet extends GetView<MyController> {
  const MyBottomSheet({Key? key, required this.info}) : super(key: key);
  final info;

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    final authC = Get.find<AuthController>();
    final myCont = Get.find<MyController>();
    DateTime sekarang = DateTime.now();
    addDate(int tambah) {
      return DateTime(sekarang.year, sekarang.month, sekarang.day + tambah);
    }

    return FloatingActionButton.extended(
      label: Row(
        children: [
          FaIcon(FontAwesomeIcons.ticket),
          SizedBox(width: 10),
          Text("Pesan Sekarang"),
        ],
      ),
      backgroundColor: primaryColor,
      foregroundColor: Colors.grey[100],
      onPressed: () {
        authC.auth.currentUser == null
            ? showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('Kamu Belum Login'),
                  content: const Text(
                      'Login terlebih dahulu untuk melanjutkan transaksimu ya'),
                  actions: <CupertinoDialogAction>[
                    CupertinoDialogAction(
                      /// This parameter indicates this action is the default,
                      /// and turns the action's text to bold text.
                      isDestructiveAction: true,
                      onPressed: () => Get.back(),
                      child: const Text('Nanti saja'),
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () => Get.offAllNamed(Routes.LOGIN),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              )
            : Get.bottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                Container(
                  height: Get.height * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 0.75))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                      ),
                      height: 70,
                      width: double.infinity,
                      child: Column(children: [
                        SizedBox(
                          width: 50,
                          child: Center(
                            child: Divider(thickness: 4),
                          ),
                        ),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(10),
                                // color: Colors.red,
                                width: double.infinity,
                                child: Text(
                                  "Paket ${info.nama}",
                                  style: TextStyle(fontSize: 20),
                                )))
                      ]),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pilih Tanggal"),
                              StreamBuilder(
                                stream: myCont.streamJadwal(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }

                                  // Menampilkan list document di snapshot
                                  return Container(
                                    height: 75,
                                    width: double.infinity,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Center(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data!.docs.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot task =
                                              snapshot.data!.docs[index];
                                          return MyButtonItem(
                                            gap: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            index: index,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 1,
                                                offset: Offset(0, 0),
                                              ),
                                            ],
                                            child: Center(
                                              child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  text: "${task["hari"]}\n",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            "${task["tanggal"]}",
                                                        style: TextStyle(
                                                            fontSize: 15)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                          // Text(task["tanggal"]);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Divider(
                                thickness: 1.5,
                                color: Colors.grey,
                              ),
                              Text("Pilih Jam"),
                              // Waktu(myCont: myCont),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Waktu(myCont: myCont),
                              ),
                              GetBuilder<MyController>(
                                builder: (_) {
                                  return Text(
                                      'Jam yang dipilih: ${myCont.jam}');
                                },
                              ),
                              info.tambahan != null
                                  ? ExtraWidget(
                                      info: info.tambahan,
                                    )
                                  : const SizedBox(),
                              //   ],
                              // ),
                              // batas jam
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     GetX<MyController>(
                              //       builder: (_) => Text(
                              //           'Harga              : ${controller.count}'),
                              //     ),
                              //     ElevatedButton.icon(
                              //         onPressed: () => controller.increment(),
                              //         icon: FaIcon(FontAwesomeIcons.plus),
                              //         label: Text("tambah")),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GetBuilder<MyController>(
                      builder: (myController) {
                        return Container(
                          color: primaryColor,
                          width: double.infinity,
                          height: 60,
                          child: TextButton(
                              onPressed: () {
                                // Get.to(Checkout());
                                myCont.jamTerpilih != null
                                    ? Get.toNamed(Routes.CHECKOUT)
                                    : Get.snackbar("Belum memilih jadwal",
                                        "Pilih terlebih dahulu jadwal yang tersedia untuk melanjutkannya ya",
                                        backgroundColor: Colors.red[200]);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  FaIcon(
                                    FontAwesomeIcons.cartShopping,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Checkout",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  ]),
                ),
              );
      },
      // child: Container(
      //   // constraints: BoxConstraints(minWidth: 120, maxWidth: Get.width * 0.4),
      //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      //   decoration: BoxDecoration(
      //     color: primaryColor,
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   child: Text(
      //     "Pesan",
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      //   ),
      // ),
    );
  }
}

class Waktu extends StatelessWidget {
  const Waktu({
    Key? key,
    required this.myCont,
  }) : super(key: key);

  final MyController myCont;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      builder: (_) {
        return StreamBuilder(
            stream: myCont.streamJadwal(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data!.docs;
              return SizedBox(
                child: data.isEmpty
                    ? Center(
                        child: Text(
                        "Belum ada jadwal terkini",
                        style: TextStyle(color: Colors.red),
                      ))
                    : List.generate(data.length, (index) {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 15,
                              childAspectRatio: 2,
                              mainAxisSpacing: 20,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data[index]["waktu"].length,
                            shrinkWrap: true,
                            itemBuilder: ((context, indexWaktu) {
                              var waktu = data[index]["waktu"][indexWaktu];

                              return GetBuilder<MyController>(
                                builder: (_) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        disabledBackgroundColor: Colors.black12,
                                        disabledForegroundColor: Colors.black,
                                        backgroundColor:
                                            myCont.jam == '${waktu['jam']}' &&
                                                    myCont.addDate(index) ==
                                                        myCont.tanggalTerpilih
                                                ? primaryColor
                                                : Colors.white),
                                    child: Text(
                                      '${waktu['jam']}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: myCont.jam == '${waktu['jam']}'
                                              ? Colors.black
                                              : Colors.black),
                                    ),
                                    onPressed: myCont.checkWaktu(
                                        waktu, data[index]['timeStamp']),
                                  );
                                },
                              );
                            }));
                      })[myCont.tabIndex],
              );
            });
      },
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Container(
        child: Center(child: Text("Test")),
      ),
    );
  }
}
