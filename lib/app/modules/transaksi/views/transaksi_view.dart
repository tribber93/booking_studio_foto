import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:studio_foto/utils/dataPaket.dart';
import 'package:studio_foto/utils/emptyWidget.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('TransaksiView'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            SizedBox(
              height: 75,
              child: Center(
                child: NavigationBar(
                  onDestinationSelected: controller.changeTabIndex,
                  selectedIndex: controller.tabIndex,
                  destinations: const [
                    NavigationDestination(
                      icon: FaIcon(FontAwesomeIcons.moneyBillTransfer),
                      label: 'Menunggu Pembayaran',
                    ),
                    NavigationDestination(
                      icon: FaIcon(FontAwesomeIcons.circleCheck),
                      label: 'Sudah dibayar',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: <Widget>[
                Tiket(),
                emptyWidget,
              ][controller.tabIndex],
            ),
          ],
        ),
      );
    });
  }
}

class Tiket extends StatelessWidget {
  const Tiket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: paket.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: TicketMaterial(
              tapHandler: () => Get.dialog(
                Center(
                  child: TicketWidget(
                    // margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 350,
                    height: 500,
                    isCornerRounded: true,
                    padding: EdgeInsets.all(20),
                    child: Text("Tiket ${index + 1}"),
                  ),
                ),
              ),
              height: 150,
              colorBackground: Colors.grey.shade100,
              leftChild: Container(
                child: Center(
                  child: Text('Tiket ${index + 1}'),
                ),
              ),
              rightChild: Container(
                child: Center(
                  child: Image.asset(paket[index]["icon"]),
                ),
              ),
              useAnimationScaleOnTap: false,
            ),
          );
        });
  }
}
