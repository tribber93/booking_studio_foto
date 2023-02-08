import 'dart:math' as math;

import 'package:animated_widgets/animated_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/controller/userController.dart';
import 'package:studio_foto/app/data/classPaket.dart';
import 'package:studio_foto/app/modules/user/dashboard/controllers/home_controller.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/formatText.dart';
import 'package:studio_foto/utils/myColor.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    final authC = Get.find<AuthController>();
    final myC = Get.find<MyController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('QM Photo Studio'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color.fromARGB(132, 232, 232, 232),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: authC.auth.currentUser == null
                          ? Text(
                              'Hello, \nSelamat Datang',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 22),
                            )
                          : StreamBuilder(
                              stream: authC.streamUsers(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                Map dataUser = (snapshot.data!.data()
                                    as Map<String, dynamic>);

                                return RichText(
                                  text: TextSpan(
                                    text: 'Hello, \n',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 22),
                                    children: [
                                      TextSpan(
                                        text: dataUser['name'],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                    ),
                  );
                }),
            Container(
              width: double.infinity,
              // height: 200,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70),
            //   child: SizedBox(
            //     height: 40,
            //     child: TextField(
            //       decoration: InputDecoration(
            //         hintStyle: TextStyle(fontSize: 12),
            //         filled: true,
            //         fillColor: Colors.white,
            //         prefixIcon: Icon(Icons.search),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(50))),
            //         hintText: 'Cari Paket',
            //       ),
            //     ),
            //   ),
            // ),
            const Divider(
              thickness: 2,
            ),
            const Text(
              'Pilih Paketmu',
              style: TextStyle(fontSize: 18),
            ),
            StreamBuilder(
                stream: myC.getPaket(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  dynamic paket = snapshot.data;
                  int jmlPaket = paket.docs.length;
//                   final QuerySnapshot snapshot = await Firestore.instance.collection("collection_name").get();
// List<String> documentIds = snapshot.documents.map((doc) => doc.documentID).toList();

                  return GridView.extent(
                      maxCrossAxisExtent: 300,
                      shrinkWrap: true,
                      childAspectRatio: 0.65,
                      clipBehavior: Clip.antiAlias,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(jmlPaket, (index) {
                        var infoPaket = paket.docs[index].data();
                        var id = paket.docs[index].id;
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 12,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          Color.fromARGB(111, 0, 0, 0),
                                          BlendMode.darken,
                                        ),
                                        image: CachedNetworkImageProvider(
                                            infoPaket['foto'][0])),
                                  ),
                                  child: Center(
                                      child: Text(
                                    infoPaket['nama'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ),
                              ),
                              Flexible(
                                flex: 6,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.white,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Harga",
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                      Text(Rupiah().format(infoPaket['harga']),
                                          style: const TextStyle(
                                            fontSize: 16,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: InkWell(
                                  onTap: () {
                                    String path =
                                        infoPaket['nama'].replaceAll(" ", "-");

                                    Get.toNamed('${Routes.DETAIL_PAKET}/$path');
                                    myC.reset();
                                    // print(id);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      color: primaryColor,
                                    ),
                                    height: 50,
                                    width: double.infinity,
                                    child: const Center(
                                        child: Text(
                                      "Detail",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }));
                }),
            // Flexible(
            //   child: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisExtent: 340,
            //     ),
            //     clipBehavior: Clip.antiAlias,
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: paketClass.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         margin: EdgeInsets.all(10),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               padding: const EdgeInsets.all(20),
            //               decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                     colorFilter: ColorFilter.mode(
            //                       Color.fromARGB(111, 0, 0, 0),
            //                       BlendMode.darken,
            //                     ),
            //                     fit: BoxFit.cover,
            //                     image:
            //                         AssetImage(paketClass[index].gambar![0])),
            //                 color: Colors.brown,
            //                 borderRadius: const BorderRadius.only(
            //                   topLeft: Radius.circular(15),
            //                   topRight: Radius.circular(15),
            //                 ),
            //               ),
            //               height: 190,
            //               child: Center(
            //                   child: Text(
            //                 paketClass[index].nama!,
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 20,
            //                     fontWeight: FontWeight.w500),
            //               )),
            //             ),
            //             Expanded(
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8),
            //                 child: RichText(
            //                   text: TextSpan(
            //                     text: '  Mulai dari\n',
            //                     style: TextStyle(
            //                         color: Colors.black, fontSize: 12),
            //                     children: [
            //                       TextSpan(
            //                           text: ' Rp. 15.000',
            //                           style: TextStyle(fontSize: 18)),
            //                       TextSpan(
            //                           text: ' /Orang\n',
            //                           style: TextStyle(fontSize: 12)),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Container(
            //               constraints: BoxConstraints(minHeight: 50),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.only(
            //                     bottomLeft: Radius.circular(15),
            //                     bottomRight: Radius.circular(15)),
            //                 color: primaryColor,
            //               ),
            //               width: double.infinity,
            //               child: TextButton(
            //                   onPressed: () {
            //                     String path = paketClass[index]
            //                         .nama!
            //                         .replaceAll(" ", "-");
            //                     Get.toNamed(
            //                       '${Routes.DETAIL_PAKET}/$path',
            //                       // arguments: paket[index],
            //                       // print("sd"); // );
            //                     );
            //                   },
            //                   child: Text(
            //                     "Detail",
            //                     style: TextStyle(
            //                         fontSize: 16, color: Colors.white),
            //                   )),
            //             )
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                CachedNetworkImage(
                    imageUrl: item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: null,
                  ),
                ),
              ],
            ),
          ),
        ))
    .toList();
