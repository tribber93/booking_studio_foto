import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:studio_foto/app/controller/adminController.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/widgetLoginSignup.dart';

class TambahPaketView extends GetView<AdminController> {
  final _formKey = GlobalKey<FormState>();
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    int addForm = 0;
    return Scaffold(
        appBar: AppBar(title: Text('Tambah Paket')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              title: 'Lanjut?',
              text: 'Yakin data sudah benar',
              confirmBtnText: 'Yakin',
              cancelBtnText: 'Cek lagi',
              onConfirmBtnTap: () async {
                Get.back();
                await controller.tambahPaket();
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Paket baru sudah ditambahkan',
                );
              },
            );
            // QuickAlert.show(dva
            // if (_formKey.currentState!.validate()) {
            //   // If the form is valid, display a snackbar. In the real world,
            //   // you'd often call a server or save the information in a database.
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('Processing Data')),
            //   );}
          },
          backgroundColor: primaryColor,
          label: Row(
            children: const [
              FaIcon(FontAwesomeIcons.floppyDisk),
              SizedBox(
                width: 10,
              ),
              Text("Simpan paket"),
            ],
          ),
        ),
        body: SafeArea(
          child: Obx(() {
            return controller.isUploading.isTrue
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 70),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextField(
                            label: '*Nama Paket',
                            controller: controller.namaController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukan nama paket';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            label: '*Harga',
                            controller: controller.hargaController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukan harga paket';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            label: "*Durasi (menit)",
                            controller: controller.durasiController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukan durasi';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            label:
                                "*Max. Orang (contoh: 1 atau 1-5)", // Only numbers can be entered
                            controller: controller.maxController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukan jumlah maksimal orang';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            label: "*Cetak",
                            controller: controller.cetakController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukan jumlah cetak';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            label: "*Softfile",
                            controller: controller.softfileController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukan jumlah softfile';
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            label: "Keterangan",
                            controller: controller.keteranganController,
                            maxLines: 7,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {
                                    controller.getImages();
                                    // print(controller.imageList);
                                  },
                                  icon: FaIcon(FontAwesomeIcons.fileCirclePlus),
                                  label: Text("Tambah Gambar")),
                              SizedBox(
                                width: 8,
                              ),
                              GetBuilder<AdminController>(
                                builder: (_) {
                                  return Text(
                                      "${controller.imageList.length.toString()} file");
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Extras (Opsional)'),
                              Text(
                                "✅ Jika iterable",
                                style: TextStyle(
                                    fontSize: 10, color: primaryColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GetBuilder<AdminController>(
                            builder: (_) {
                              return Column(
                                children: List.generate(addForm, (index) {
                                  return Row(
                                    children: [
                                      Flexible(
                                          flex: 5,
                                          child: MyTextField(
                                            controller: index == 0
                                                ? controller.extra1
                                                : index == 1
                                                    ? controller.extra2
                                                    : index == 2
                                                        ? controller.extra3
                                                        : index == 3
                                                            ? controller.extra4
                                                            : controller.extra5,
                                            label: "Item ${index + 1}",
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: MyTextField(
                                          controller: index == 0
                                              ? controller.hargaExtra1
                                              : index == 1
                                                  ? controller.hargaExtra2
                                                  : index == 2
                                                      ? controller.hargaExtra3
                                                      : index == 3
                                                          ? controller
                                                              .hargaExtra4
                                                          : controller
                                                              .hargaExtra5,
                                          // controller.hargaExtra1,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          label: "Harga",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                          flex: 1,
                                          child: Checkbox(
                                            value: controller.checks[index],
                                            onChanged: (value) {
                                              controller.checks[index] =
                                                  !controller.checks[index];
                                              print(controller.checks);
                                              controller.update();
                                            },
                                          )),
                                    ],
                                  );
                                  // MyTextField(
                                  //   label: "Tambahan ${index + 1}",
                                  // );
                                }),
                              );
                            },
                          ),
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  addForm < 5 ? addForm += 1 : null;
                                  controller.update();
                                },
                                icon: const FaIcon(FontAwesomeIcons.circlePlus),
                                label: Text("Tambah Form"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "*maksimal 5",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       print(controller.imageList);
                          //       if (_formKey.currentState!.validate()) {
                          //         // If the form is valid, display a snackbar. In the real world,
                          //         // you'd often call a server or save the information in a database.
                          //         ScaffoldMessenger.of(context).showSnackBar(
                          //           const SnackBar(content: Text('Processing Data')),
                          //         );
                          //       }
                          //     },
                          //     child: Text("test"),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ));
          }),
        ));
  }
}
