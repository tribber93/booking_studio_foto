import 'package:get/get.dart';

import '../controllers/profile_lengkap_controller.dart';

class ProfileLengkapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileLengkapController>(
      () => ProfileLengkapController(),
    );
  }
}
