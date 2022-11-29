import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransaksiView'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black12,
      body: Container(
        margin: EdgeInsets.all(25),
        alignment: Alignment.center,
        child: EmptyWidget(
          packageImage: PackageImage.Image_1,
          title: 'Belum ada Transaksi',
          subTitle: 'Silakan buat transaksi pertamamu',
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(169, 0, 0, 0),
          ),
          hideBackgroundAnimation: true,
        ),
      ),
      // Center(
      //   child: TicketWidget(
      //     margin: const EdgeInsets.symmetric(vertical: 10),
      //     width: 350,
      //     height: 500,
      //     isCornerRounded: true,
      //     padding: EdgeInsets.all(20),
      //     child: Text("Test"),
      //   ),
      // ),
    );
  }
}
