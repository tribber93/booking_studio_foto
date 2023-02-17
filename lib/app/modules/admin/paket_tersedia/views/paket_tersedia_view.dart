import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/paket_tersedia_controller.dart';

class PaketTersediaView extends GetView<PaketTersediaController> {
  const PaketTersediaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaketTersediaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PaketTersediaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
