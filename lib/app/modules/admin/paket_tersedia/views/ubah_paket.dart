import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:studio_foto/app/modules/admin/paket_tersedia/controllers/paket_tersedia_controller.dart';
import 'package:studio_foto/utils/formatText.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/widgetLoginSignup.dart';

class UbahView extends GetView<PaketTersediaController> {
  final formKey = GlobalKey<FormState>();
  // bool isChecked = false;
  final info = Get.arguments;

  UbahView({super.key});

  @override
  Widget build(BuildContext context) {
    final infoPaket = info.data();
    final idPaket = info.id;
    int addForm = 0;

    return Scaffold(
        appBar: AppBar(title: const Text('Ubah Paket')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            // bool cek =
            //     controller.imageFile == null || controller.imageFile!.isEmpty;
            // print(controller.imageFile);

            if (formKey.currentState!.validate()) {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.confirm,
                title: 'Lanjut?',
                text: 'Yakin data sudah benar',
                confirmBtnText: 'Yakin',
                cancelBtnText: 'Cek lagi',
                onConfirmBtnTap: () async {
                  Get.back();
                  await controller.updatePaket(
                    id: idPaket,
                    images: infoPaket['foto'],
                    oldExtras: infoPaket['tambahan'],
                  );
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Paket berhasil diupdate',
                  );
                },
              );
            }
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
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 70),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextField(
                            enabled: false,
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
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: MyTextField(
                                    label: "Min (Opsional)",
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: controller.minController,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: MyTextField(
                                    label: "*Max Orang",
                                    controller: controller.maxController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Masukan jumlah maksimal orang';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
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
                          SizedBox(
                            width: double.infinity,
                            child: ExpansionTile(
                              textColor: Colors.black87,
                              title:
                                  Text("Gambar (${infoPaket['foto'].length})"),
                              children: List.generate(
                                infoPaket['foto'].length,
                                (imageIndex) => Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(8),
                                  height: 150,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 125,
                                        width: 125,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                              infoPaket['foto'][imageIndex],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              controller.deleteImage(
                                                  context: context,
                                                  url: infoPaket['foto']
                                                      [imageIndex],
                                                  id: idPaket,
                                                  images: infoPaket['foto']);
                                            },
                                            icon: const FaIcon(
                                                FontAwesomeIcons.trash,
                                                color: Colors.red),
                                          ),
                                          const Text("Hapus")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            child: ExpansionTile(
                              textColor: Colors.black87,
                              title: Text(
                                  "Extra paket (${infoPaket['tambahan'].length})"),
                              children: List.generate(
                                  infoPaket['tambahan'].length, (extraIndex) {
                                Map infoExtra =
                                    infoPaket['tambahan'][extraIndex];
                                return Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            infoExtra['extra'],
                                          ),
                                          Text(
                                            Rupiah().format(infoExtra['harga']),
                                          ),
                                          Text(infoExtra['isIterable']
                                              ? '(Bisa ditambah)'
                                              : '')
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              controller.deleteExtras(
                                                id: idPaket,
                                                extras: infoPaket['tambahan'],
                                                dipilih: infoExtra,
                                                context: context,
                                              );
                                            },
                                            icon: const FaIcon(
                                                FontAwesomeIcons.trash,
                                                color: Colors.red),
                                          ),
                                          const Text("Hapus")
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {
                                    controller.getImages();
                                  },
                                  icon: const FaIcon(
                                      FontAwesomeIcons.fileCirclePlus),
                                  label: const Text("Tambah Gambar")),
                              const SizedBox(
                                width: 8,
                              ),
                              GetBuilder<PaketTersediaController>(
                                builder: (_) {
                                  return Text(
                                      "${controller.imageList.length.toString()} file");
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Tambahan Extras (Opsional)'),
                              Text(
                                "✅ Jika iterable",
                                style: TextStyle(
                                    fontSize: 10, color: primaryColor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<PaketTersediaController>(
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
                                      const SizedBox(
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
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                          flex: 1,
                                          child: Checkbox(
                                            value: controller.checks[index],
                                            onChanged: (value) {
                                              controller.checks[index] =
                                                  !controller.checks[index];
                                              controller.update();
                                            },
                                          )),
                                    ],
                                  );
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
                                label: const Text("Tambah Form"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
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
