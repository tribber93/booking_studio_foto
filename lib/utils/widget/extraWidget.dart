import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/modules/user/detail_paket/views/myBottomSheet.dart';

class ExtraWidget extends StatelessWidget {
  ExtraWidget({
    required this.info,
    Key? key,
  }) : super(key: key);

  final info;

  @override
  Widget build(BuildContext context) {
    final myCont = Get.find<MyController>();
    return GetBuilder<MyController>(builder: (myController) {
      return Container(
        padding: EdgeInsets.only(top: 20, bottom: 15, left: 4, right: 4),
        child: info.isEmpty
            ? SizedBox()
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0.4),
                    ),
                  ]),
                  child: ExpansionTile(
                    title: Text("Tambahan".tr, style: Get.textTheme.bodyText2),
                    initiallyExpanded: true,
                    children: List.generate(
                      info.length,
                      (index) {
                        if (myCont.counts.length != info.length) {
                          myCont.isChecks.add(false);
                          myCont.counts.add(0);
                        }

                        var infoCheck = info[index];
                        return infoCheck['isIterable'] == true
                            ? Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      infoCheck['extra'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Counter(
                                      hasil: myCont.counts[index],
                                      controller: myCont,
                                      onTapMinus: () {
                                        if (myCont.counts[index] > 0) {
                                          myCont.counts[index] -= 1;
                                          myCont.update();
                                        }
                                      },
                                      onTapPlus: () {
                                        myCont.counts[index] += 1;
                                        myCont.update();
                                      },
                                      onTapDownMinus: (TapDownDetails details) {
                                        myCont.timer = Timer.periodic(
                                            Duration(milliseconds: 200), (t) {
                                          // controller.decrement();
                                          if (myCont.counts[index] > 0) {
                                            myCont.counts[index] -= 1;
                                            myCont.update();
                                          }
                                        });
                                      },
                                      onTapDownPlus: (TapDownDetails details) {
                                        myCont.timer = Timer.periodic(
                                            Duration(milliseconds: 200), (t) {
                                          // controller.decrement();
                                          myCont.counts[index] += 1;
                                          myCont.update();
                                        });
                                      },
                                    )
                                  ],
                                ),
                              )
                            : CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                value: myCont.isChecks[index],
                                onChanged: (value) {
                                  myCont.isChecks[index] =
                                      !myCont.isChecks[index];
                                  // myController.checkbox(value, index, info);
                                  debugPrint(
                                      "nilai ${infoCheck["extra"]} ${myCont.isChecks[index]}");
                                  myController.update();
                                },
                                title: Text(
                                  infoCheck["extra"],
                                  style: Get.textTheme.bodyText1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  maxLines: 1,
                                ),
                              );
                      },
                    ),
                  ),
                )),
      );
    });
  }
}
