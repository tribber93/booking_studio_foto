import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/utils/myColor.dart';

import '../controllers/detail_paket_controller.dart';

class DetailPaketView extends GetView<DetailPaketController> {
  DetailPaketView({Key? key}) : super(key: key);

  final info = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: primaryColor,
              pinned: true,
              snap: false,
              floating: false,
              // automaticallyImplyLeading: false,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Paket ${info["nama"]}",
                  style: TextStyle(color: Colors.white),
                ),
                background: Stack(
                  alignment: const Alignment(0, -0.5),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          // alignment: Alignment.bottomCenter,
                          colorFilter: ColorFilter.mode(
                            Color.fromARGB(111, 0, 0, 0),
                            BlendMode.darken,
                          ),
                          image: AssetImage(info["image"][0]),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //padding: EdgeInsets.only(bottom: 100),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  // height: 500,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Nama Paket   : Paket ${info["nama"]}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Maks. Orang  : ${info["maks"]} Orang'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Harga              : Rp. 100.000/15 Menit'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Keterangan     :'),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        style: TextStyle(height: 1.5, wordSpacing: 1.5),
                      ),
                      Container(
                        height: 350.0,
                        child: ListView.builder(
                            // physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: info["image"].length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 250,
                                  child: Card(
                                    // semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.asset(
                                      info["image"][index],
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    // margin: EdgeInsets.all(10),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ]),
              // child:
            )
          ],
        ),
        // SafeArea(
        //     child: SingleChildScrollView(
        //   child: Stack(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             colorFilter: ColorFilter.mode(
        //                 Color.fromARGB(93, 0, 0, 0), BlendMode.darken),
        //             fit: BoxFit.cover,
        //             image: AssetImage(info["image"][0]),
        //           ),
        //         ),
        //         child: Center(
        //           child: Text(
        //             "Paket foto ${info["nama"]}",
        //             style: TextStyle(
        //                 fontSize: 24,
        //                 fontWeight: FontWeight.w700,
        //                 color: Colors.white),
        //           ),
        //         ),
        //         height: 350,
        //         width: double.infinity,
        //       ),
        //       IconButton(
        //         onPressed: () {
        //           Get.back();
        //         },
        //         icon: FaIcon(FontAwesomeIcons.arrowLeft),
        //         color: Colors.white,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(top: 225),
        //         child: Container(
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //           ),
        //           // height: 500,
        //           width: double.infinity,
        //           padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisSize: MainAxisSize.max,
        //             children: [
        //               Text(
        //                 "Deskripsi",
        //                 style: TextStyle(
        //                     fontSize: 18, fontWeight: FontWeight.w500),
        //               ),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //               Text('Nama Paket   : Paket ${info["nama"]}'),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Text('Maks. Orang  : ${info["maks"]} Orang'),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Text('Harga              : Rp. 100.000/15 Menit'),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Text('Keterangan     :'),
        //               SizedBox(
        //                 height: 8,
        //               ),
        //               Text(
        //                 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        //                 style: TextStyle(height: 1.5, wordSpacing: 1.5),
        //               ),
        //               Container(
        //                 height: 350.0,
        //                 child: ListView.builder(
        //                     // physics: const ClampingScrollPhysics(),
        //                     shrinkWrap: true,
        //                     scrollDirection: Axis.horizontal,
        //                     itemCount: info["image"].length,
        //                     itemBuilder: (BuildContext context, int index) {
        //                       return GestureDetector(
        //                         onTap: () {},
        //                         child: Container(
        //                           padding: const EdgeInsets.all(10),
        //                           width: 250,
        //                           child: Card(
        //                             // semanticContainer: true,
        //                             clipBehavior: Clip.antiAliasWithSaveLayer,
        //                             child: Image.asset(
        //                               info["image"][index],
        //                               fit: BoxFit.fill,
        //                             ),
        //                             shape: RoundedRectangleBorder(
        //                               borderRadius: BorderRadius.circular(10.0),
        //                             ),
        //                             elevation: 5,
        //                             // margin: EdgeInsets.all(10),
        //                           ),
        //                         ),
        //                       );
        //                     }),
        //               ),
        //             ],
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // )),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.bottomSheet(Container(
              // height: Get.height * 0.6,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              margin: !context.isPhone
                  ? const EdgeInsets.only(right: 150, left: 150)
                  : null,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Paket ${info["nama"]}")),
                  Text("Pilih Tanggal"),
                  SizedBox(
                    height: 75,
                    child: ListView.builder(
                        // padding: EdgeInsets.all(8),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 20,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "10 Nov",
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    Text("Hari Ini")
                                  ]),
                            ),
                          );
                        }),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Colors.grey,
                  ),
                  Text("Pilih Jam"),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 25,
                      ),
                      itemBuilder: (_, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.amber,
                          ),
                          child: Center(child: Text("9.30")),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Checkout")))
                ],
              ),
            ));
          },
          child: Container(
            color: primaryColor,
            height: 60,
            child: Center(
                child: Text(
              "Pesan Sekarang",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )),
          ),
        ));
  }
}
