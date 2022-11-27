import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/modules/dashboard/views/info_tempat_view.dart';
import 'package:studio_foto/app/modules/dashboard/views/profile_view.dart';
import 'package:studio_foto/app/modules/home/views/home_view.dart';
import 'package:studio_foto/utils/myColor.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                InfoTempatView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: TextStyle(color: Colors.black),
            selectedItemColor: primaryColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showUnselectedLabels: false,
            items: [
              _bottomNavigationBarItem(
                  const FaIcon(FontAwesomeIcons.house), "Home"),
              _bottomNavigationBarItem(
                  const FaIcon(FontAwesomeIcons.info), "Info Tempat"),
              _bottomNavigationBarItem(
                  const FaIcon(FontAwesomeIcons.solidUser), "Profile"),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem(Widget icon, String label) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
