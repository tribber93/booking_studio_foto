import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:studio_foto/app/controller/adminController.dart';
import 'package:studio_foto/app/controller/verifikasiHP.dart';
import 'package:studio_foto/app/modules/admin/adminDashboard/views/pesanan.dart';
import 'package:studio_foto/app/modules/admin/adminDashboard/views/tambah_jadwal.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

class AdminDashboardView extends GetView<AdminController> {
  AdminDashboardView({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());
    Get.put(VerifyController());
    final adminC = Get.find<AdminController>();
    List<Map> menu = [
      {
        "icon": "assets/icons/clock-hands.png",
        "title": "Tambah Jadwal",
        "ke": () {
          Get.to(() => const TambahJadwalView(),
              routeName: "${Routes.ADMIN_DASHBOARD}/tambah-jadwal");
          adminC.reset();
        },
      },
      {
        "icon": "assets/icons/order.png",
        "title": "Pesanan",
        "ke": () {
          Get.to(() => const PesananView(),
              routeName: "${Routes.ADMIN_DASHBOARD}/pesanan");
          adminC.reset();
        },
      },
      {
        "icon": "assets/icons/package-box.png",
        "title": "Informasi Paket",
        "ke": () {
          Get.toNamed(Routes.PAKET_TERSEDIA);
          adminC.reset();
        },
      },
      {
        "icon": "assets/icons/exit.png",
        "title": "Keluar",
        "ke": () async {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            title: "Yakin ingin keluar?",
            onConfirmBtnTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            confirmBtnText: "Ya",
            cancelBtnText: "Kembali",
          );
        },
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminDashboardView'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.extent(
            physics: const RangeMaintainingScrollPhysics(),
            padding: const EdgeInsets.all(15),
            maxCrossAxisExtent: 300,
            shrinkWrap: true,
            children: List.generate(
                menu.length,
                (index) => GestureDetector(
                      onTap: menu[index]['ke'],
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              menu[index]['icon'],
                              height: 64,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(menu[index]['title']),
                          ],
                        ),
                      ),
                    ))),
      ),
    );
  }
}
