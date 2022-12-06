import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/myCustomScrollBehavior.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:studio_foto/utils/myThemeData.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  widgetsBinding;
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDateFormatting('id_ID', null).then((_) => runApp(
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: GetMaterialApp(
              theme: myThemedata,
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
              scrollBehavior: MyCustomScrollBehavior(),
            ),
          ),
        ),
      ));
  // FlutterNativeSplash.remove();
}
