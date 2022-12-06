import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/modules/user/detail_paket/controllers/detail_paket_controller.dart';
import 'package:studio_foto/app/modules/user/transaksi/controllers/transaksi_controller.dart';

class MyButtonItem extends StatelessWidget {
  MyButtonItem({
    Key? key,
    required this.index,
    this.child,
    this.gap,
    this.boxShadow,
    this.padding,
  }) : super(key: key);
  int index;
  Widget? child;
  EdgeInsets? gap;
  List<BoxShadow>? boxShadow;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var sekarang = DateTime.now();
    addDate(int tambah) {
      return DateTime(sekarang.year, sekarang.month, sekarang.day + tambah);
    }

    return GetBuilder<MyController>(builder: (controller) {
      return Container(
        margin: gap,
        child: InkWell(
          onTap: () {
            controller.changeTabIndex(index);
            // debugPrint(
            //     DateFormat("EEE, d MMM yyyy", "id_ID").format(addDate(index)));
          },
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(20),
              color: controller.tabIndex == index
                  ? Colors.grey.shade200
                  : Colors.white,
            ),
            child: child,
          ),
        ),
      );
    });
  }
}
