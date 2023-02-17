import 'package:get/get.dart';

import '../controllers/paket_tersedia_controller.dart';

class PaketTersediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaketTersediaController>(
      () => PaketTersediaController(),
    );
  }
}
