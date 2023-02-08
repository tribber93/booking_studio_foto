import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/formatText.dart';
import 'package:studio_foto/utils/myColor.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<MyController> {
  CheckoutView({Key? key}) : super(key: key);
  final myC = Get.find<MyController>();
  final authC = Get.find<AuthController>();
  final arg = Get.arguments;
  NumberFormat rupiah = NumberFormat.simpleCurrency(locale: "id", name: 'Rp. ');

  @override
  Widget build(BuildContext context) {
    List cek = arg['cek'];
    List counter = arg['counter'];
    var data = arg['data'];
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckoutView'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                  child: Text("Informasi Paket yang dipilih",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600))),
              SizedBox(
                height: 10,
              ),
              InfoPemesanan(
                nama: "Paket",
                harga: "${data['nama']}",
              ),
              InfoPemesanan(
                nama: 'Tanggal',
                harga: '${myC.tanggalTerpilih}',
              ),
              InfoPemesanan(
                nama: 'Jam',
                harga: '${myC.jamTerpilih}',
              ),
              InfoPemesanan(
                nama: "Harga Paket",
                harga: rupiah.format(data['harga']),
              ),
              counter.isNotEmpty || cek.isNotEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Tambahan",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  : SizedBox(),
              counter.isNotEmpty
                  ? Column(
                      children: List.generate(counter.length, (index) {
                        int ke = counter[index];
                        return InfoPemesanan(
                          nama: "${data['tambahan'][ke]['extra']}",
                          harga:
                              "${myC.counts[ke]} * ${rupiah.format(data['tambahan'][ke]['harga'])}",
                        );
                      }),
                    )
                  : SizedBox(),
              cek.isNotEmpty
                  ? Column(
                      children: List.generate(cek.length, (index) {
                        int ke = cek[index];
                        return InfoPemesanan(
                          nama: "${data['tambahan'][ke]['extra']}",
                          harga:
                              "${rupiah.format(data['tambahan'][ke]['harga'])}",
                        );
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text("${data['tambahan'][ke]['extra']}"),
                        //     Text("Rp. ${data['tambahan'][ke]['harga']}"),
                        //   ],
                        // );
                      }),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      rupiah.format(myC.total),
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: primaryColor,
                child: TextButton.icon(
                    clipBehavior: Clip.antiAlias,
                    onPressed: () async {
                      List extraCek = [];
                      List extraCounter = [];

                      for (var element in cek) {
                        extraCek.add({
                          "extra": data['tambahan'][element]['extra'],
                          "harga": data['tambahan'][element]['harga'],
                        });
                      }
                      for (var element in counter) {
                        // var ke =element
                        extraCounter.add({
                          "extra": data['tambahan'][element]['extra'],
                          "jumlah": myC.counts[element],
                          "harga": data['tambahan'][element]['harga'],
                        });
                      }

                      if (controller.jamTerpilih == '') {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.warning,
                            title: 'Warning!',
                            text: 'Kamu sudah memesan paket ini');
                        return;
                      }
                      await myC.sendTransaksi(
                        nama: data['nama'],
                        user: authC.auth.currentUser!.displayName,
                        email: authC.auth.currentUser!.email,
                        extraCek: extraCek.isEmpty ? null : extraCek,
                        extraCounter:
                            extraCounter.isEmpty ? null : extraCounter,
                      );
                      // ignore: use_build_context_synchronously
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'Pesanan berhasil',
                        text: 'Selanjutnya kamu bisa menghubungi admin',
                        onConfirmBtnTap: () =>
                            Get.offAllNamed(Routes.DASHBOARD),
                      );
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.paperPlane,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Pesan",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
