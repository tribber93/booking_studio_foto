import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
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

    if (info['min'] != null) {
      myCont.jumlahOrang = info['min'];
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
        // print(myCont.tanggalTerpilih);
        // myCont.cek();
        // print(myCont.idJadwal);
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
                                  "Paket ${info['nama']}",
                                  style: TextStyle(fontSize: 20),
                                )))
                      ]),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: StreamBuilder(
                            stream: myCont.streamJadwal(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              var data = snapshot.data!.docs;
                              return Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Pilih Tanggal",
                                              ),
                                              Container(
                                                height: 75,
                                                width: double.infinity,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Center(
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: data.length,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, index) {
                                                      DocumentSnapshot tanggal =
                                                          data[index];

                                                      return MyButtonItem(
                                                        gap: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        index: index,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 1,
                                                            offset:
                                                                Offset(0, 0),
                                                          ),
                                                        ],
                                                        child: Center(
                                                          child: RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                              text:
                                                                  "${tanggal["hari"]}\n",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        "${tanggal["tanggal"]}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.5,
                                                color: Colors.grey,
                                              ),
                                              Text("Pilih Jam"),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Waktu(
                                                  myCont: myCont,
                                                  data: data,
                                                ),
                                              ),
                                              info['min'] != null
                                                  ? Divider(
                                                      thickness: 0.5,
                                                      color: Colors.grey,
                                                    )
                                                  : SizedBox(),
                                              info['min'] != null
                                                  ? GetBuilder<MyController>(
                                                      builder: (myCont) {
                                                        return Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 9,
                                                                  left: 20,
                                                                  right: 20),
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "Jumlah Orang"),
                                                              Counter(
                                                                controller:
                                                                    myCont,
                                                                hasil: myCont
                                                                    .jumlahOrang,
                                                                onTapMinus: () {
                                                                  if (myCont
                                                                          .jumlahOrang >
                                                                      info[
                                                                          'min']) {
                                                                    myCont.jumlahOrang -=
                                                                        1;
                                                                    myCont
                                                                        .update();
                                                                  }
                                                                },
                                                                onTapPlus: () {
                                                                  if (myCont
                                                                          .jumlahOrang <
                                                                      info[
                                                                          'max']) {
                                                                    myCont.jumlahOrang +=
                                                                        1;
                                                                    myCont
                                                                        .update();
                                                                  }
                                                                },
                                                                onTapDownMinus:
                                                                    (TapDownDetails
                                                                        details) {
                                                                  myCont.timer =
                                                                      Timer.periodic(
                                                                          Duration(
                                                                              milliseconds: 200),
                                                                          (t) {
                                                                    // controller.decrement();
                                                                    if (myCont
                                                                            .jumlahOrang >
                                                                        info[
                                                                            'min']) {
                                                                      myCont.jumlahOrang -=
                                                                          1;
                                                                      myCont
                                                                          .update();
                                                                    }
                                                                  });
                                                                },
                                                                onTapDownPlus:
                                                                    (TapDownDetails
                                                                        details) {
                                                                  myCont.timer =
                                                                      Timer.periodic(
                                                                          Duration(
                                                                              milliseconds: 200),
                                                                          (t) {
                                                                    if (myCont
                                                                            .jumlahOrang <
                                                                        info[
                                                                            'max']) {
                                                                      myCont.jumlahOrang +=
                                                                          1;
                                                                      myCont
                                                                          .update();
                                                                    }
                                                                    // controller.decrement();
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    )
                                                  : const SizedBox()
                                            ],
                                          )
                                        : SizedBox(
                                            height: 200,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/alarm-clock.png',
                                                    height: 150,
                                                  ),
                                                  const Text(
                                                    'Belum ada jadwal',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    info['tambahan'] != null
                                        ? ExtraWidget(
                                            info: info['tambahan'],
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    GetBuilder<MyController>(
                      builder: (myController) {
                        return Container(
                          color: primaryColor,
                          width: double.infinity,
                          height: 60,
                          child: TextButton(
                              onPressed: () async {
                                List indexCek = [];
                                List indexCount = [];
                                if (info['min'] == null) {
                                  myCont.total =
                                      (myCont.total + info['harga']).round();
                                } else {
                                  myCont.total = (myCont.total +
                                          (info['harga'] * myCont.jumlahOrang))
                                      .round();
                                }

                                for (var i = 0;
                                    i < myCont.isChecks.length;
                                    i++) {
                                  if (myCont.isChecks[i] != false) {
                                    myCont.total = (myCont.total +
                                            info['tambahan'][i]['harga'])
                                        .round();
                                    indexCek.add(i);
                                  }
                                }
                                for (var i = 0; i < myCont.counts.length; i++) {
                                  if (myCont.counts[i] != 0) {
                                    myCont.total = (myCont.total +
                                            (myCont.counts[i] *
                                                info['tambahan'][i]['harga']))
                                        .round();
                                    print(myCont.counts[i]);
                                    indexCount.add(i);
                                  }
                                }
                                myCont.jamTerpilih != ""
                                    ? await Get.toNamed(Routes.CHECKOUT,
                                        arguments: {
                                            'data': info,
                                            'cek': indexCek,
                                            'counter': indexCount
                                          })
                                    : QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.warning,
                                        text:
                                            'Kamu harus memilih jadwal terlebih dahulu',
                                      );
                                myCont.total = 0;
                                myCont.update();
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

class Counter extends StatelessWidget {
  Counter(
      {Key? key,
      required this.controller,
      this.onTapMinus,
      this.onTapDownMinus,
      this.onTapPlus,
      this.onTapDownPlus,
      required this.hasil})
      : super(key: key);

  final MyController controller;
  int hasil;
  void Function()? onTapMinus;
  void Function(TapDownDetails)? onTapDownMinus;
  void Function()? onTapPlus;
  void Function(TapDownDetails)? onTapDownPlus;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      builder: (_) {
        return Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: onTapMinus,
                // onTap: () => controller.decrement(),
                onTapDown: onTapDownMinus,
                // (TapDownDetails details) {
                //   controller.timer =
                //       Timer.periodic(Duration(milliseconds: 200), (t) {
                //     // controller.decrement();
                //     onTapDownMinus;
                //   });
                // },
                onTapUp: (TapUpDetails details) {
                  controller.cancelIncrease();
                },
                onTapCancel: () {
                  controller.cancelIncrease();
                },
                child: const FaIcon(FontAwesomeIcons.minus),
              ),
              GetBuilder<MyController>(
                builder: (_) => Text(hasil.toString()),
              ),
              GestureDetector(
                onTap: onTapPlus,
                // controller.increment(),
                onTapDown: onTapDownPlus,
                onTapUp: (TapUpDetails details) {
                  controller.cancelIncrease();
                },
                onTapCancel: () {
                  controller.cancelIncrease();
                },
                child: const FaIcon(FontAwesomeIcons.plus),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Waktu extends StatelessWidget {
  const Waktu({Key? key, required this.myCont, required this.data})
      : super(key: key);

  final MyController myCont;
  final data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      builder: (_) {
        return SizedBox(
          child: List.generate(data.length, (index) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            backgroundColor: myCont.jam == '${waktu['jam']}' &&
                                    data[index]['idJadwal'] ==
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
                        onPressed:
                            myCont.checkWaktu(waktu, data[index]['timeStamp']),
                      );
                    },
                  );
                }));
          })[myCont.tabIndex],
        );
      },
    );
  }
}
