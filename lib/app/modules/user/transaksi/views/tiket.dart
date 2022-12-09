import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/data/classPaket.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Tiket extends StatelessWidget {
  const Tiket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: paketClassReversed.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: TicketMaterial(
                flexLefSize: 65,
                useAnimationScaleOnTap: false,
                tapHandler: () => Get.dialog(
                      Center(
                        child: TicketWidget(
                            // margin: const EdgeInsets.symmetric(vertical: 10),
                            // margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 500,
                            width: context.isPhone ? Get.width - 100 : 400,
                            isCornerRounded: true,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Container(
                                  color: Colors.red,
                                  child: SizedBox.square(
                                    dimension: 320,
                                  ),
                                ),
                                Container(
                                  color: Colors.black,
                                  child: SizedBox.square(
                                    dimension: 140,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                height: 160,
                colorBackground: Colors.grey.shade100,
                leftChild: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
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
                        const SizedBox.square(
                          dimension: 8,
                        ),
                        RichText(
                          text: const TextSpan(
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
                rightChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(paketClassReversed[index].icon),
                        Text(
                          paketClassReversed[index].nama,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
