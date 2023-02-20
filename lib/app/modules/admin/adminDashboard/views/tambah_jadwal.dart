import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/controller/adminController.dart';
import 'package:studio_foto/utils/myColor.dart';

class TambahJadwalView extends GetView<AdminController> {
  const TambahJadwalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TambahJadwalPage')),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                controller: controller.tanggalController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Can not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  controller.addJadwal(context);
                },
                child: const Text("Generate Jadwal"),
              ),
            ],
          ),
        )));
  }
}
