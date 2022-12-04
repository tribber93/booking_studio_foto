import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/utils/myButtonItem.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/widget/myCheckbox.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    Key? key,
    required this.info,
  }) : super(key: key);

  final info;

  @override
  Widget build(BuildContext context) {
    final myController = Get.put(MyController());
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
                            "Paket ${info["nama"]}",
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
                        // SizedBox(
                        //   height: 75,
                        //   child: ListView.builder(
                        //       // padding: EdgeInsets.all(8),
                        //       shrinkWrap: true,
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: 6,
                        //       itemBuilder: (context, index) {
                        //         return Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Container(
                        //             height: 20,
                        //             width: 80,
                        //             decoration: BoxDecoration(
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                   color: Colors.black45,
                        //                   blurRadius: 0.1,
                        //                   spreadRadius: 0.3,
                        //                   offset: Offset(1, 1),
                        //                 )
                        //               ],
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(10)),
                        //               color: Colors.grey[100],
                        //             ),
                        //             child: Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.center,
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   Text(
                        //                     "10 Nov",
                        //                     style: TextStyle(fontSize: 11),
                        //                   ),
                        //                   Text("Hari Ini")
                        //                 ]),
                        //           ),
                        //         );
                        //       }),
                        // ),
                        Container(
                          // color: Colors.amber,
                          height: 90,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Center(
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                MyButtonItem(
                                  index: 0,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                  gap: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "Hari ini\n",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: "Minggu",
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ),
                                MyButtonItem(
                                  index: 1,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                  gap: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "5 Des\n",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: "Senin",
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ),
                                MyButtonItem(
                                  index: 2,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                  gap: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "6 Des\n",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                            text: "Selasa",
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 25,
                            ),
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 0.5,
                                        spreadRadius: 0.2,
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                  ),
                                  child: Center(child: Text("09.30")),
                                ),
                              );
                            },
                            itemCount: 10,
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     GetX<MyController>(
                        //       builder: (_) => Text(
                        //           'Harga              : ${myController.count}'),
                        //     ),
                        //     ElevatedButton.icon(
                        //         onPressed: () => myController.increment(),
                        //         icon: FaIcon(FontAwesomeIcons.plus),
                        //         label: Text("tambah")),
                        //   ],
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<MyController>(
                          builder: (_) {
                            return ExpansionTile(
                              // textColor: Colors.red,
                              collapsedBackgroundColor: Colors.grey.shade200,
                              title: Text(
                                "Tambahan",
                                style: Get.textTheme.bodyText1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                maxLines: 1,
                              ),
                              children: [
                                myCheckbox(
                                  controller: myController,
                                  text: "1 softfile edit",
                                ),
                                myCheckbox(
                                  controller: myController,
                                  text: "Ganti background",
                                ),
                                myCheckbox(
                                  controller: myController,
                                  text: "Ganti baju",
                                ),
                                myCheckbox(
                                  controller: myController,
                                  text: "Cetak 5R + laminasi",
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: context.isPhone ? Get.width * 0.5 : 200,
                    child: Center(
                      child: Text(
                        "Rp. 100000",
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
