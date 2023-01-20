import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/cupertino.dart';
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
  TransaksiView({Key? key}) : super(key: key);
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    return Scaffold(
        appBar: AppBar(
          title: Text('TransaksiView'),
        ),
        body: GetBuilder<MyController>(
          builder: (controller) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CustomSlidingSegmentedControl<int>(
                      innerPadding: const EdgeInsets.all(5),
                      initialValue: 0,
                      children: {
                        0: Text('Belum dibayar'),
                        1: Text('Transaksi berhasil'),
                        2: Text('Transaksi batal'),
                      },
                      decoration: BoxDecoration(
                        color: CupertinoColors.lightBackgroundGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      thumbDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          ),
                        ],
                      ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInToLinear,
                      onValueChanged: (v) {
                        tab = v;
                        controller.update();
                      },
                    ),
                  ),
                  Expanded(
                    child: [
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
                    ][tab],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
