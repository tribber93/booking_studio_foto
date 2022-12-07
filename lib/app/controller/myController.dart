import 'package:get/get.dart';

class MyController extends GetxController {
  //TODO: Implement DetailPaketController

  bool isChecked = false;
  var tabIndex = 0;
  var count = 1.obs;
  RxInt total = 0.obs;

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

  void checkbox(bool? value, int index, List info) {
    info[index]["isCheck"] = value;
    addTotal(info, index);
    update();
  }

  void addTotal(info, int index) {
    int harga = info[index]["harga"];
    if (info[index]["isCheck"] == true) {
      total = total + harga;
    } else {
      total = total - harga;
    }

    // void addTotal(info, int index) {
    //   List data = info["tambahan"];
    //   data.forEach((index) {
    //     int harga = index["harga"];
    //     if (index["isCheck"] == true) {
    //       total = total + harga;
    //     }
    //   });

    // for(Map data in info["tambahan"]){
    //     if(data["isCheck"] == true){
    //       int harga = data["harga"];
    //     }
    //   }
  }
}
