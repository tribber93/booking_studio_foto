import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:studio_foto/utils/myCustomScrollBehavior.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 620),
        child: GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
        ),
      ),
    ),
  );
}
