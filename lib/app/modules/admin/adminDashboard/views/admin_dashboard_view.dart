import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/data/classPaket.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdminDashboardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: paketClass[0].gambar!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(paketClass[0].gambar![index]),
                  );
                },
              ),
            ),
            Text(paketClass[0].nama.toString()),
            Text(paketClass[0].harga.toString()),
          ],
        )),
      ),
    );
  }
}
