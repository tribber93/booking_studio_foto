import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  List paket = [
    {
      "nama": "Solo",
      "image": [
        "assets/images/paket/solo1.jpg",
        "assets/images/paket/solo2.jpg",
        "assets/images/paket/solo3.jpg"
      ],
      "maks": 1
    },
    {
      "nama": "Wedding",
      "image": [
        "assets/images/paket/wed1.jpg",
        "assets/images/paket/wed2.jpg",
        "assets/images/paket/wed3.jpg",
      ],
      "maks": 2
    },
    {
      "nama": "Graduate",
      "image": [
        "assets/images/paket/grad3.jpg",
        "assets/images/paket/grad2.jpg",
        "assets/images/paket/grad1.jpg",
      ],
      "maks": 1
    },
    {
      "nama": "Keluarga",
      "image": [
        "assets/images/paket/fam3.jpg",
        "assets/images/paket/fam2.jpg",
        "assets/images/paket/fam1.jpg",
      ],
      "maks": 5
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QM Photo Studio'),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      backgroundColor: Color.fromARGB(132, 232, 232, 232),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              height: 100,
              child: Text(
                "Hello, Yoni",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintText: 'Cari Paket',
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const Text(
              'Pilih Paketmu',
              style: TextStyle(fontSize: 18),
            ),
            Container(
              height: 350.0,
              child: ListView.builder(
                  // physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: paket.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            '${Routes.DETAIL_PAKET}/paket${paket[index]["nama"]}',
                            arguments: paket[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Color.fromARGB(93, 0, 0, 0),
                              BlendMode.darken,
                            ),
                            fit: BoxFit.cover,
                            image: AssetImage(
                              paket[index]["image"][0],
                            ),
                          ),
                        ),
                        width: 250,
                        child: Center(
                          child: Text(
                            'Paket ${paket[index]["nama"]}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Card(
                        //   child: Center(
                        //     child: Text('Paket ${paket[index]["nama"]}'),
                        //   ),
                        // ),
                      ),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint(paket[0]["image"][2]);
                },
                child: Text("image"))
          ],
        ),
      ),
    );
  }
}
