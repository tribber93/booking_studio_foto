import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/utils/emptyWidget.dart';
import 'package:studio_foto/utils/formatText.dart';
import 'package:studio_foto/utils/myButtonItem.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/myLeading.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/transaksi_controller.dart';
import 'tiket.dart';

class TransaksiView extends GetView<TransaksiController> {
  TransaksiView({Key? key}) : super(key: key);
  int tab = 0;
  final authC = Get.find<AuthController>();
  final myC = Get.find<MyController>();
  static final Uri urlWhatsapp = Uri.parse("https://wa.me/+6283149857944");
  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    return Scaffold(
        appBar: AppBar(
          title: Text('TransaksiView'),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: myC.streamTransaksi(authC.auth.currentUser!.email),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data!.docs;
              List belumBayar = [];
              List berhasil = [];
              List batal = [];

              for (var element in data) {
                if (!element['sukses'] && !element['batal']) {
                  belumBayar.add(element);
                } else if (element['sukses']) {
                  berhasil.add(element);
                } else if (element['batal']) {
                  batal.add(element);
                }
              }

              return Container(
                margin: const EdgeInsets.all(8),
                child: GetBuilder<MyController>(
                  builder: (c) {
                    return Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomSlidingSegmentedControl<int>(
                            innerPadding: const EdgeInsets.all(5),
                            initialValue: 0,
                            children: const {
                              0: Text('Belum dibayar'),
                              1: Text('Transaksi berhasil'),
                              2: Text('Transaksi batal'),
                            },
                            decoration: BoxDecoration(
                              color: CupertinoColors.lightBackgroundGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            thumbDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                ),
                              ],
                            ),
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInToLinear,
                            onValueChanged: (v) {
                              tab = v;
                              c.update();
                            },
                          ),
                        ),
                        Expanded(
                          child: [
                            belumBayar.isEmpty
                                ? myEmptyWidget(
                                    title: 'Belum ada Transaksi',
                                    subTitle:
                                        'Silakan buat transaksi pertamamu',
                                    packageImage: PackageImage.Image_1,
                                  )
                                : TiketTransaksi(status: belumBayar),
                            berhasil.isEmpty
                                ? myEmptyWidget(
                                    title: 'Belum ada Transaksi',
                                    subTitle:
                                        'Silakan buat transaksi pertamamu',
                                    packageImage: PackageImage.Image_4,
                                  )
                                : TiketTransaksi(status: berhasil),
                            batal.isEmpty
                                ? myEmptyWidget(
                                    title: 'Belum ada Transaksi',
                                    subTitle:
                                        'Silakan buat transaksi pertamamu',
                                    packageImage: PackageImage.Image_2,
                                  )
                                : TiketTransaksi(status: batal),

                            // Tiket(),
                            // myEmptyWidget(
                            //   title: 'Belum ada Transaksi',
                            //   subTitle: 'Silakan buat transaksi pertamamu',
                            //   packageImage: PackageImage.Image_1,
                            // ),
                            // myEmptyWidget(
                            //   title: 'Belum ada Transaksi Batal',
                            //   subTitle: 'Silakan buat transaksi pertamamu',
                            //   packageImage: PackageImage.Image_2,
                            // ),
                          ][tab],
                        ),
                      ],
                    );
                  },
                ),
              );
            }));
  }
}

class TiketTransaksi extends StatelessWidget {
  const TiketTransaksi({
    super.key,
    required this.status,
  });

  final List status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          itemCount: status.length,
          itemBuilder: (context, index) {
            // print(status[index]['tanggal']);
            final reversedList = status.reversed.toList();
            final statusReversed = reversedList[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TicketMaterial(
                  flexLefSize: 65,
                  useAnimationScaleOnTap: false,
                  tapHandler: () => Get.dialog(
                        Center(
                          child: TicketWidget(
                              // margin: const EdgeInsets.symmetric(vertical: 10),
                              // margin: const EdgeInsets.symmetric(horizontal: 30),
                              height: 550,
                              width: context.isPhone ? Get.width - 50 : 400,
                              isCornerRounded: true,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      "Paket \n${statusReversed['nama']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          fontSize: 28,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InfoPemesanan(
                                    nama: "Tanggal",
                                    harga: statusReversed['tanggal'],
                                  ),
                                  InfoPemesanan(
                                    nama: "Jam",
                                    harga: statusReversed['jam'],
                                  ),
                                  InfoPemesanan(
                                    nama: "Harga paket",
                                    harga: Rupiah()
                                        .format(statusReversed['harga']),
                                  ),
                                  statusReversed['jumlahOrang'] != null
                                      ? InfoPemesanan(
                                          nama: "Jumlah Orang",
                                          harga:
                                              "${statusReversed['jumlahOrang']}",
                                        )
                                      : const SizedBox(),
                                  statusReversed['extraCounter'] != null ||
                                          statusReversed['extraCek'] != null
                                      ? InfoPemesanan(
                                          nama: "Tambahan",
                                          style: const TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : SizedBox(),
                                  statusReversed['extraCounter'] != null
                                      ? Column(
                                          children: List.generate(
                                              statusReversed['extraCounter']
                                                  .length, (index) {
                                            Map data =
                                                statusReversed['extraCounter']
                                                    [index];
                                            return InfoPemesanan(
                                              nama: "${data['extra']}",
                                              harga:
                                                  "${data['jumlah']} * ${Rupiah().format(data['harga'])}",
                                            );
                                          }),
                                        )
                                      : SizedBox(),
                                  statusReversed['extraCek'] != null
                                      ? Column(
                                          children: List.generate(
                                              statusReversed['extraCek'].length,
                                              (index) {
                                            Map data =
                                                statusReversed['extraCek']
                                                    [index];
                                            return InfoPemesanan(
                                              nama: "${data['extra']}",
                                              harga:
                                                  "${Rupiah().format(data['harga'])}",
                                            );
                                          }),
                                        )
                                      : SizedBox(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              decoration: TextDecoration.none,
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          Rupiah()
                                              .format(statusReversed['total']),
                                          style: const TextStyle(
                                              fontFamily: "Poppins",
                                              decoration: TextDecoration.none,
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  !statusReversed['batal'] &&
                                          !statusReversed['sukses']
                                      ? Center(
                                          child: TextButton.icon(
                                            style: ButtonStyle(
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.green)),
                                            label:
                                                Text("Konfirmasi via WhatsApp"),
                                            // color: Colors.green,
                                            // iconSize: 20,
                                            onPressed: () {
                                              _launchInBrowser(Uri.parse(
                                                  "https://wa.me/+6283149857944"));
                                            },
                                            icon: FaIcon(
                                                FontAwesomeIcons.whatsapp),
                                          ),
                                        )
                                      : const SizedBox(),
                                  // RichText(
                                  //     text: TextSpan(
                                  //         style: Theme.of(context)
                                  //             .textTheme
                                  //             .titleMedium,
                                  //         children: [
                                  //       TextSpan(children: [
                                  //         TextSpan(text: "Jam"),
                                  //         TextSpan(
                                  //             text:
                                  //                 statusReversed['jam'] + '\n')
                                  //       ]),
                                  //       TextSpan(
                                  //           text: statusReversed['tanggal'] +
                                  //               '\n'),
                                  //       TextSpan(
                                  //           text:
                                  //               '${Rupiah().format(statusReversed['total'])}\n'),
                                  //     ])),
                                ],
                              )
                              // ListView(
                              //   physics: NeverScrollableScrollPhysics(),
                              //   children: [
                              //     Container(
                              //       // color: Colors.red,
                              //       child: Text(statusReversed['nama']),
                              //       // SizedBox.square(
                              //       //   dimension: 320,
                              //       // ),
                              //     ),
                              //     Container(
                              //       color: Colors.black,
                              //       child: SizedBox.square(
                              //         dimension: 140,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              ),
                        ),
                      ),
                  height: 160,
                  colorBackground: Colors.grey.shade100,
                  leftChild: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Tanggal\n",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                              children: [
                                TextSpan(
                                  text: statusReversed['tanggal'],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox.square(
                            dimension: 8,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Jam\n",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                              children: [
                                TextSpan(
                                  text: statusReversed['jam'],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox.square(
                            dimension: 8,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Total\n",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                              children: [
                                TextSpan(
                                  text:
                                      Rupiah().format(statusReversed['total']),
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  rightChild: SizedBox(
                    child: Center(
                      child: Text(
                        statusReversed['nama'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            );
          }),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
