import 'package:get/get.dart';

class MyController extends GetxController {
  //TODO: Implement DetailPaketController

  bool isChecked = false;
  var tabIndex = 0;
  var count = 1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
    count += 3;
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  changeCheckbox(bool? value) {
    isChecked = value!;
    update();
  }
}
