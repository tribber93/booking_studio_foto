import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';

import '../controllers/transaksi_controller.dart';

class TransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiController>(
      () => TransaksiController(),
    );
  }
}
