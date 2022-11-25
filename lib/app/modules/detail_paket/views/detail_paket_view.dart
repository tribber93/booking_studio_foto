import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/detail_paket_controller.dart';

class DetailPaketView extends GetView<DetailPaketController> {
  DetailPaketView({Key? key}) : super(key: key);

  final title = Get.arguments;

  final galeri = [
    "assets/images/paket/IMG_0676-1365x2048.jpg",
    "assets/images/paket/IMG_0670-1365x2048 .jpg",
    "assets/images/paket/IMG_0119-1365x2048.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.arrowLeft),
                color: Colors.white,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: context.isPhone
                        ? Alignment.topCenter
                        : Alignment.center,
                    image: AssetImage('assets/images/work.png'),
                  ),
                ),
                height: 350,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 225),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Colors.white,
                  ),
                  // height: 500,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Text(
                          "Paket foto $title",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Nama Paket   : Paket $title'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Maks. Orang  : 2 Orang'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Harga              : Rp. 100.000/15 Menit'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Keterangan     :'),
                      Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                      Container(
                        height: 350.0,
                        child: ListView.builder(
                            // physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: galeri.length,
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
                                      galeri[index],
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
                ),
              )
            ],
          ),
        )),
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
                  Center(child: Text("Paket $title")),
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
            color: Colors.blue,
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
