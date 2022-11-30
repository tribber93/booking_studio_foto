import 'package:get/get.dart';

import '../controllers/detail_paket_controller.dart';

class DetailPaketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPaketController>(
      () => DetailPaketController(),
    );
  }
}
