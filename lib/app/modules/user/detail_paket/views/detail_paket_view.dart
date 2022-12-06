import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/data/dataPaket.dart';
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

  data() {
    for (var item in paket) {
      String path = item["nama"].replaceAll(" ", "-");
      if (Get.currentRoute == "${Routes.DETAIL_PAKET}/$path") {
        return item;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: myLeading,
              backgroundColor: primaryColor,
              pinned: true,
              snap: false,
              floating: false,
              automaticallyImplyLeading: false,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Paket ${data()["nama"]}",
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
                          image: AssetImage(data()["image"][0]),
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
                      Text('Nama Paket   : Paket ${data()["nama"]}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Maks. Orang  : ${data()["maks"]} Orang'),
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
                            itemCount: data()["image"].length,
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
                                      data()["image"][index],
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
        bottomNavigationBar: MyBottomSheet(
          info: data(),
        ));
  }
}
