import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/controller/verifikasiHP.dart';
import 'package:studio_foto/app/modules/user/dashboard/views/info_tempat_view.dart';
import 'package:studio_foto/app/modules/user/dashboard/views/otp_view.dart';
import 'package:studio_foto/app/modules/user/dashboard/views/profile_view.dart';
import 'package:studio_foto/app/modules/user/dashboard/views/home_view.dart';
import 'package:studio_foto/utils/myColor.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return StreamBuilder(
            stream: AuthController().streamUsers(),
            builder: (context, user) {
              if (!user.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              var phoneNumber = user.data!.get('phoneNumber');
              // return phoneNumber == null;
              return Scaffold(
                body: phoneNumber == null
                    ? OTP(controller: VerifyController())
                    : SafeArea(
                        child: IndexedStack(
                          index: controller.tabIndex,
                          children: [
                            HomeView(),
                            const InfoTempatView(),
                            ProfileView(),
                          ],
                        ),
                      ),
                bottomNavigationBar: phoneNumber == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SalomonBottomBar(
                          currentIndex: controller.tabIndex,
                          onTap: (index) => controller.changeTabIndex(index),
                          items: [
                            SalomonBottomBarItem(
                              icon: Image.asset(
                                "assets/icons/home.png",
                                height: 25,
                                width: 25,
                              ),
                              title: const Text("Home"),
                              selectedColor: primaryColor,
                            ),
                            SalomonBottomBarItem(
                              icon: Image.asset(
                                "assets/icons/info.png",
                                height: 25,
                                width: 25,
                              ),
                              title: const Text("Informasi"),
                              selectedColor: primaryColor,
                            ),
                            SalomonBottomBarItem(
                              icon: Image.asset(
                                "assets/icons/userButton.png",
                                height: 25,
                                width: 25,
                              ),
                              title: const Text("Profile"),
                              selectedColor: primaryColor,
                            ),
                          ],
                        ),
                      ),
              );
            });
      },
    );
  }
}
