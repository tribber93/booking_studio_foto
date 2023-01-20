import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<MyController> {
  CheckoutView({Key? key}) : super(key: key);
  final myC = Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckoutView'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tanggal : ' + myC.tanggalTerpilih,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Jam : ' + myC.jamTerpilih,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
