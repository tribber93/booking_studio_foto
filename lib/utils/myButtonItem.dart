import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/modules/user/transaksi/controllers/transaksi_controller.dart';

class MyButtonItem extends StatelessWidget {
  MyButtonItem({
    Key? key,
    required this.index,
    this.child,
  }) : super(key: key);
  int index;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiController>(builder: (controller) {
      return InkWell(
        onTap: () => controller.changeTabIndex(index),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: controller.tabIndex == index
                ? Colors.grey.shade400
                : Colors.white,
          ),
          child: child,
        ),
      );
    });
  }
}
