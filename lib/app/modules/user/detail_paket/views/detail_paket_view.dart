import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/data/classPaket.dart';
import 'package:studio_foto/app/modules/user/detail_paket/views/myBottomSheet.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/myButtonItem.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/myLeading.dart';

import '../controllers/detail_paket_controller.dart';

class DetailPaketView extends GetView<DetailPaketController> {
  DetailPaketView({Key? key}) : super(key: key);

  final myController = Get.put(MyController());
  // dynamic info = Get.arguments;

  // data() {
  //   for (var item in paketClass) {
  //     String path = item.nama!.replaceAll(" ", "-");
  //     if (Get.currentRoute == "${Routes.DETAIL_PAKET}/$path") {
  //       return item;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: myController.getPaket(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List paket = snapshot.data!.docs;
          data() {
            for (var infoPaket in paket) {
              String path = infoPaket['nama'].replaceAll(" ", "-");
              if (Get.currentRoute == "${Routes.DETAIL_PAKET}/$path") {
                return infoPaket;
              }
            }
          }

          var infoPaket = data();

          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  // leading: myLeading,
                  backgroundColor: primaryColor,
                  pinned: true,
                  snap: false,
                  floating: false,
                  // automaticallyImplyLeading: false,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Paket ${data()['nama']}",
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
                              colorFilter: const ColorFilter.mode(
                                Color.fromARGB(111, 0, 0, 0),
                                BlendMode.darken,
                              ),
                              image:
                                  CachedNetworkImageProvider(data()['foto'][0]),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                          Text('Nama Paket   : Paket ${data()['nama']}'),
                          SizedBox(
                            height: 10,
                          ),
                          data()['min'] != null
                              ? Text(
                                  'Maks. Orang  : ${data()['min']} - ${data()['max']} Orang')
                              : Text('Maks. Orang  : ${data()['max']} Orang'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              'Harga              : ${NumberFormat.simpleCurrency(locale: "id", name: 'Rp. ').format(data()['harga'])}'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Keterangan     :'),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Hayo Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                            style: TextStyle(height: 1.5, wordSpacing: 1.5),
                          ),
                          Container(
                            height: 350.0,
                            child: ListView.builder(
                                // physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: data()['foto'].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 250,
                                      child: Card(
                                        // semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        // CachedNetworkImage(
                                        //     data()['foto'][index]),
                                        //  Image.asset(
                                        //   data().gambar[index],
                                        //   fit: BoxFit.fill,
                                        // ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        data()['foto'][index]),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
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
            floatingActionButton: MyBottomSheet(info: data()),

            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     data()['nama'];
            //   },
            //   child: Text("Pesan"),
            // ),
            // bottomNavigationBar: MyBottomSheet(
            // info: data(),
            // )
          );
        });
  }
}
