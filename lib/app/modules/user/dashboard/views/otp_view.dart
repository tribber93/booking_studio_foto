import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';

class OTPView extends GetView<MyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('OTPPage')),
        body: SafeArea(child: Text('OTPController')));
  }
}
