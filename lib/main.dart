import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studio_foto/app/controller/adminController.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'firebase_options.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:studio_foto/utils/myCustomScrollBehavior.dart';
import 'package:studio_foto/utils/myThemeData.dart';
import 'app/routes/app_pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "QM Studio Photo",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController(), permanent: true);
  Get.put(AdminController(), permanent: true);

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await initializeDateFormatting('id_ID', null).then((_) =>
  runApp(StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        String init = Routes.LOGIN;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          snapshot.data!.email != "admin@qmstudio.co.id"
              ? init = Routes.DASHBOARD
              : init = Routes.ADMIN_DASHBOARD;
        }

        return Center(
          child: Container(
            // constraints: const BoxConstraints(maxWidth: 768),
            child: GetMaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('id'), Locale('en')],
              theme: myThemedata,
              title: "Application",
              initialRoute: init,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
              scrollBehavior: MyCustomScrollBehavior(),
            ),
          ),
        );
      })); //,
  // );
}
