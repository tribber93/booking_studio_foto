import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InfoTempatView extends GetView {
  const InfoTempatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InfoTempatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InfoTempatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
