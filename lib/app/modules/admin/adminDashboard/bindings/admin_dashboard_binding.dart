import 'package:get/get.dart';
import 'package:studio_foto/app/controller/adminController.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(
      () => AdminDashboardController(),
    );
    Get.lazyPut<AdminController>(
      () => AdminController(),
    );
  }
}
