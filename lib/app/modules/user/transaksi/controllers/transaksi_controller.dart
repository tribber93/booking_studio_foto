import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TransaksiController extends GetxController {
  //TODO: Implement TransaksiController

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
