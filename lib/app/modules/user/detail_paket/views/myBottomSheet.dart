import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/modules/user/detail_paket/controllers/detail_paket_controller.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/myButtonItem.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/widget/extraWidget.dart';

class MyBottomSheet extends GetView<MyController> {
  const MyBottomSheet({Key? key, required this.info}) : super(key: key);
  final info;

  @override
  Widget build(BuildContext context) {
    DateTime sekarang = DateTime.now();
    addDate(int tambah) {
      return DateTime(sekarang.year, sekarang.month, sekarang.day + tambah);
    }

    return InkWell(
      onTap: () {
        Get.bottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          Container(
            height: Get.height * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            // width: double.infinity,
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
                height: 100,
                width: double.infinity,
                // color: Colors.red,
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
                          padding: const EdgeInsets.all(15),
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
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pilih Tanggal"),
                        Container(
                          height: 75,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Center(
                            child: ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (DateFormat("EEEE", "id_ID")
                                        .format(addDate(index)) !=
                                    "Jumat") {
                                  index - 1;
                                }
                                return DateFormat("EEEE", "id_ID")
                                            .format(addDate(index)) !=
                                        "Jumat"
                                    ? MyButtonItem(
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
                                              text:
                                                  "${DateFormat("d MMM", "id_ID").format(addDate(index))}\n",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "${DateFormat("EEEE", "id_ID").format(addDate(index))}",
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Libur();
                              },
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        ),
                        Text("Pilih Jam"),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<MyController>(
                          builder: (myController) {
                            return Container(
                              height: 200,
                              width: double.infinity,
                              child: Center(
                                child: [
                                  Text("Satu"),
                                  Text("Dua"),
                                  Text("Tiga"),
                                  Text("Empat"),
                                  Text("Lima"),
                                ][myController.tabIndex],
                              ),
                            );
                          },
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(10),
                        //   child: GridView.builder(
                        //     shrinkWrap: true,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     gridDelegate:
                        //         SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 4,
                        //       crossAxisSpacing: 15,
                        //       mainAxisSpacing: 15,
                        //       mainAxisExtent: 25,
                        //     ),
                        //     itemBuilder: (_, index) {
                        //       return [
                        //         Text("Satu"),
                        //         Text("Dua"),
                        //         Text("Tiga")
                        //       ][controller.tabIndex];
                        //       // InkWell(
                        //       //   onTap: () {},
                        //       //   child: Container(
                        //       //     decoration: BoxDecoration(
                        //       //       boxShadow: [
                        //       //         BoxShadow(
                        //       //           color: Colors.black45,
                        //       //           blurRadius: 0.5,
                        //       //           spreadRadius: 0.2,
                        //       //         ),
                        //       //       ],
                        //       //       borderRadius:
                        //       //           BorderRadius.all(Radius.circular(50)),
                        //       //       color: Colors.white,
                        //       //     ),
                        //       //     child: Center(child: Text("09.30")),
                        //       //   ),
                        //       // );
                        //     },
                        //     itemCount: 10,
                        //   ),
                        // ),

                        SizedBox(
                          height: 20,
                        ),
                        info.tambahan != null
                            ? ExtraWidget(
                                info: info.tambahan,
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              GetX<MyController>(
                builder: (myController) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: context.isPhone ? Get.width * 0.5 : 200,
                        child: Center(
                          child: Text(
                            "Rp. ${myController.total}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        color: primaryColor,
                        width: context.isPhone ? Get.width * 0.5 : 300,
                        height: 60,
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                      ),
                    ],
                  );
                },
              ),
            ]),
          ),
        );
      },
      child: Container(
        color: primaryColor,
        height: 60,
        child: Center(
          child: Text(
            "Pesan Sekarang",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class Libur extends StatelessWidget {
  const Libur({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 1,
          offset: Offset(0, 0),
        ),
      ], borderRadius: BorderRadius.circular(20), color: Colors.red[50]),
      child: Center(child: Text("Libur")),
    );
  }
}
