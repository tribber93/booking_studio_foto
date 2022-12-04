import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/data/dataPaket.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

class DetailPaketController extends GetxController {
  //TODO: Implement DetailPaketController

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
