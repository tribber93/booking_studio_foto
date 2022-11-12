import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  List paket = ["Solo", "Wedding", "Graduate", "Keluaga Besar"];

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
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: 250,
                      child: Card(
                        child: Center(
                          child: Text('Paket ${paket[index]}'),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
