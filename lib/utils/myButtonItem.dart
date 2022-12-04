import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  }) : super(key: key);
  int index;
  Widget? child;
  EdgeInsets? gap;
  List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(builder: (controller) {
      return Container(
        margin: gap,
        child: InkWell(
          onTap: () => controller.changeTabIndex(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(20),
              color: controller.tabIndex == index
                  ? Colors.grey.shade400
                  : Colors.white,
            ),
            child: child,
          ),
        ),
      );
    });
  }
}
