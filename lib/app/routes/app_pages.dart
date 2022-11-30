import 'package:get/get.dart';

import '../modules/user/dashboard/bindings/dashboard_binding.dart';
import '../modules/user/dashboard/views/dashboard_view.dart';
import '../modules/user/detail_paket/bindings/detail_paket_binding.dart';
import '../modules/user/detail_paket/views/detail_paket_view.dart';
import '../modules/user/login/bindings/login_binding.dart';
import '../modules/user/login/views/login_view.dart';
import '../modules/user/profile_lengkap/bindings/profile_lengkap_binding.dart';
import '../modules/user/profile_lengkap/views/profile_lengkap_view.dart';
import '../modules/user/signup/bindings/signup_binding.dart';
import '../modules/user/signup/views/signup_view.dart';
import '../modules/user/transaksi/bindings/transaksi_binding.dart';
import '../modules/user/transaksi/views/transaksi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PAKET,
      page: () => DetailPaketView(),
      binding: DetailPaketBinding(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: _Paths.PROFILE_LENGKAP,
      page: () => const ProfileLengkapView(),
      binding: ProfileLengkapBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => const TransaksiView(),
      binding: TransaksiBinding(),
    ),
  ];
}
