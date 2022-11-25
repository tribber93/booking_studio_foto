import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/modules/dashboard/controllers/dashboard_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
