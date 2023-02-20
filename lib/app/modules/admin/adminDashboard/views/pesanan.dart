import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/controller/adminController.dart';
import 'package:studio_foto/utils/formatText.dart';

class PesananView extends GetView<AdminController> {
  const PesananView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PesananView'),
          bottom: const TabBar(
            // isScrollable: true,
            labelColor: Colors.black,
            labelStyle:
                TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.1),
            tabs: <Widget>[
              Tab(
                text: "Belum dibayar",
              ),
              Tab(
                text: "Berhasil",
              ),
              Tab(
                text: "Batal",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            StreamPesanan(
              controller: controller,
              status: 'belum bayar',
            ),
            StreamPesanan(
              controller: controller,
              status: 'sukses',
            ),
            StreamPesanan(
              controller: controller,
              status: 'batal',
            ),
          ],
        ),
      ),
    );
  }
}

class StreamPesanan extends StatelessWidget {
  const StreamPesanan({
    super.key,
    required this.controller,
    required this.status,
  });
  final status;
  final AdminController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: controller.streamPesanan(status: status),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        var data = snapshot.data!.docs;
        List dataReversed = data.reversed.toList();

        // print(data[0].id);
        return ListView.builder(
          shrinkWrap: true,
          itemCount: dataReversed.length,
          itemBuilder: (context, index) {
            String nomor = dataReversed[index]['phoneNumber'];
            String phoneNumber =
                "${nomor.substring(0, 3)} ${nomor.substring(3, 6)}-${nomor.substring(6, 10)}-${nomor.substring(10)}";

            return Container(
              margin: const EdgeInsets.all(8),
              // height: 200,
              width: double.infinity,
              // color: Colors.red,
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Paket ${dataReversed[index]['nama']}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InfoPemesanan(
                          nama: "Nama Pemesan",
                          harga: dataReversed[index]['namaPemesan'],
                        ),
                        // InfoPemesanan(
                        //   nama: "Email",
                        //   harga: dataReversed[index]['userEmail'],
                        // ),
                        InfoPemesanan(
                          nama: "Nomor Pemesan",
                          harga: phoneNumber,
                        ),
                        InfoPemesanan(
                          nama: "Tanggal",
                          harga: dataReversed[index]['tanggal'],
                        ),
                        InfoPemesanan(
                          nama: "Jam",
                          harga: dataReversed[index]['jam'],
                        ),
                        InfoPemesanan(
                          nama: "Harga paket",
                          harga: Rupiah().format(dataReversed[index]['harga']),
                        ),
                        dataReversed[index]['jumlahOrang'] != null
                            ? InfoPemesanan(
                                nama: "Jumlah orang",
                                harga: "${dataReversed[index]['jumlahOrang']}",
                              )
                            : const SizedBox(),
                        dataReversed[index]['extraCek'] != null ||
                                dataReversed[index]['extraCounter'] != null
                            ? const Text(
                                "Tambahan",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            : const SizedBox(),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Rupiah().format(dataReversed[index]['total']),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        status == 'belum bayar'
                            ? const SizedBox(
                                height: 40,
                              )
                            : const SizedBox(),
                        status == 'belum bayar'
                            ? SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => controller.batalkanPesanan(
                                            id: dataReversed[index].id,
                                            tanggal: dataReversed[index]
                                                ['tanggal'],
                                            jam: dataReversed[index]['jam']),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          color: Colors.red,
                                          child: const Text(
                                            "Batal",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.konfirmasiPesanan(
                                                dataReversed[index].id),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          color: Colors.green,
                                          child: const Text(
                                            "Konfirmasi",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Expanded(child: Text("Batal")),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )),
            );
          },
        );
      },
    );
  }
}
