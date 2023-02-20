import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/modules/admin/adminDashboard/views/tambah_paket.dart';
import 'package:studio_foto/app/modules/admin/paket_tersedia/views/ubah_paket.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/formatText.dart';
import 'package:studio_foto/utils/myColor.dart';

import '../controllers/paket_tersedia_controller.dart';

class PaketTersediaView extends GetView<PaketTersediaController> {
  const PaketTersediaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    final myC = Get.find<MyController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaketTersediaView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Paket tersedia",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            StreamBuilder(
                stream: myC.getPaket(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  dynamic paket = snapshot.data;
                  int jmlPaket = paket.docs.length;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: jmlPaket,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var infoPaket = paket.docs[index].data();
                        var id = paket.docs[index].id;
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                          infoPaket['foto'][0],
                                        ),
                                      )),
                                  // color: Colors.amber,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(infoPaket['nama']),
                                        Text(
                                            Rupiah().format(infoPaket['harga']))
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SizedBox(
                                    child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.namaController.text =
                                            infoPaket['nama'];
                                        controller.hargaController.text =
                                            infoPaket['harga'].toString();
                                        controller.durasiController.text =
                                            infoPaket['durasi'].toString();
                                        controller.maxController.text =
                                            infoPaket['max'].toString();
                                        controller.minController.text =
                                            infoPaket['min'].toString();
                                        controller.cetakController.text =
                                            infoPaket['cetak'].toString();
                                        controller.softfileController.text =
                                            infoPaket['softfile'].toString();
                                        controller.keteranganController.text =
                                            infoPaket['keterangan'];

                                        Get.to(() => UbahView(),
                                            routeName:
                                                "${Routes.PAKET_TERSEDIA}/ubah-paket",
                                            arguments: paket.docs[index]);
                                        // controller.reset();
                                      },
                                      icon: const FaIcon(
                                        FontAwesomeIcons.penToSquare,
                                        color: primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    IconButton(
                                      onPressed: () {
                                        controller.deletePaket(
                                          context: context,
                                          id: id,
                                          images: infoPaket['foto'],
                                        );
                                      },
                                      icon: const FaIcon(
                                        FontAwesomeIcons.trash,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(() => TambahPaketView());
        },
        label: Row(
          children: const [
            Icon(FontAwesomeIcons.plus),
            SizedBox(width: 10),
            Text("Tambah Paket"),
          ],
        ),
      ),
    );
  }
}
