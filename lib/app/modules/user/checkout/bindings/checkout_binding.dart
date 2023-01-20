import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';

import '../controllers/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(),
    );
    Get.lazyPut<MyController>(
      () => MyController(),
    );
  }
}
