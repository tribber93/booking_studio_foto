import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/utils/dataPaket.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:ticket_widget/ticket_widget.dart';

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
                    child: SingleChildScrollView(
                      child: Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Tiket ${index + 1}",
                                style: DefaultTextStyle.of(context).style,
                              ),
                              Container(
                                color: Colors.red,
                                height: 200,
                                width: 100,
                              ),
                              Container(
                                color: Colors.orange,
                                height: 200,
                                width: 100,
                              ),
                              Container(
                                color: Colors.brown,
                                height: 200,
                                width: 100,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              height: 150,
              colorBackground: Colors.grey.shade100,
              leftChild: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Paket\n",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                          children: [
                            TextSpan(
                              text: paket[index]["nama"],
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      SizedBox.square(
                        dimension: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Tanggal\n",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                          children: [
                            TextSpan(
                              text: "1 Desember 2022",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      SizedBox.square(
                        dimension: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Jam\n",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                          children: [
                            TextSpan(
                              text: "09.30",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
