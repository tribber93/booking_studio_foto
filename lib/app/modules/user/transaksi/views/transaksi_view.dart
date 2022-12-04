import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/utils/emptyWidget.dart';
import 'package:studio_foto/utils/myButtonItem.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/myLeading.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../controllers/transaksi_controller.dart';
import 'tiket.dart';

class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: Text('TransaksiView'),
      ),
      backgroundColor: Colors.grey.shade300,
      body: GetBuilder<MyController>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                height: 85,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyButtonItem(
                      gap: const EdgeInsets.symmetric(horizontal: 10),
                      index: 0,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBillTransfer,
                            color: Colors.green[700],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Belum dibayar")
                        ],
                      ),
                    ),
                    MyButtonItem(
                      gap: const EdgeInsets.symmetric(horizontal: 10),
                      index: 1,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.circleCheck,
                            color: Colors.green[700],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Sudah dibayar"),
                        ],
                      ),
                    ),
                    MyButtonItem(
                      gap: const EdgeInsets.symmetric(horizontal: 10),
                      index: 2,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.ban,
                            color: Colors.red[700],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Batal"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: <Widget>[
                  Tiket(),
                  myEmptyWidget(
                    title: 'Belum ada Transaksi',
                    subTitle: 'Silakan buat transaksi pertamamu',
                    packageImage: PackageImage.Image_1,
                  ),
                  myEmptyWidget(
                    title: 'Belum ada Transaksi Batal',
                    subTitle: 'Silakan buat transaksi pertamamu',
                    packageImage: PackageImage.Image_2,
                  ),
                ][controller.tabIndex],
              ),
            ],
          );
        },
      ),
    );
  }
}
