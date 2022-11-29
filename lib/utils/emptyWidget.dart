import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

Container emptyWidget = Container(
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
);
