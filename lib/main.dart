import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/myCustomScrollBehavior.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  widgetsBinding;
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 620),
        child: GetMaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            color: primaryColor,
            centerTitle: true,
          )),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
        ),
      ),
    ),
  );
  // FlutterNativeSplash.remove();
}
