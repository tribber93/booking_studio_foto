import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_paket_controller.dart';

class DetailPaketView extends GetView<DetailPaketController> {
  const DetailPaketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailPaketView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailPaketView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
