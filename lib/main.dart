import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:studio_foto/utils/myCustomScrollBehavior.dart';
import 'package:studio_foto/utils/myThemeData.dart';
import 'app/routes/app_pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await initializeDateFormatting('id_ID', null).then((_) =>
  runApp(Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: GetMaterialApp(
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [Locale('id'), Locale('en')],
        theme: myThemedata,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
      ),
    ),
  )); //,
  // );
}
