import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

myEmptyWidget({
  required String? title,
  required String? subTitle,
  PackageImage? packageImage,
  String? image,
}) {
  return Container(
    alignment: Alignment.center,
    child: EmptyWidget(
      image: image,
      packageImage: packageImage,
      title: title,
      subTitle: subTitle,
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
}
