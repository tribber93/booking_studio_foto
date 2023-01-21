import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/app/controller/adminController.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/data/classPaket.dart';
import 'package:studio_foto/app/modules/admin/adminDashboard/views/tambah_paket.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/myColor.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminController> {
  AdminDashboardView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());
    final adminC = Get.find<AdminController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('AdminDashboardView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => TambahPaketView(),
                        routeName: "${Routes.ADMIN_DASHBOARD}/tambah-paket");
                    adminC.reset();
                  },
                  child: Text("Tambah Paket")),
              DateTimePicker(
                locale: const Locale('id', 'ID'),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'Pilih Tanggal',
                // cursorColor: primaryColor,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    FontAwesomeIcons.calendar,
                    color: primaryColor,
                  ),
                  hintText: 'Pilih Tanggal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: primaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: adminC.tanggalController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Can not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  adminC.addJadwal();
                },
                child: Text("Generate Jadwal"),
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     return;
              //   },
              // ),
              // StreamBuilder(
              //   stream: myCont.streamJadwal(myCont.tanggal),
              //   builder: (context, snapshot) {
              //     final jadwal = snapshot.data!.data()?["jadwal"];
              //     // print(jam);

              //     return SizedBox(
              //         child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: List.generate(jadwal.length, (index) {
              //         return Text(jadwal[index]["jam"]);
              //       }),
              //     ));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
