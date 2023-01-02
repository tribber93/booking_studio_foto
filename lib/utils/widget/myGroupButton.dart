import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
// import 'package:studio_foto/app/controller/buttonController.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/utils/myColor.dart';

class MyGroupButton extends StatelessWidget {
  MyGroupButton({
    Key? key,
    this.info,
    this.data,
  }) : super(key: key);
  final info;
  var data;
  var hariIni = DateTime.now();

  int jamSekarang = DateTime.now().hour;
  int menitSekarang = DateTime.now().minute;
  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    final myCont = Get.find<MyController>();
    return ScrollInjector(
      groupingType: GroupingType.wrap,
      child: StreamBuilder(
          stream: myCont.streamJadwal(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LinearProgressIndicator();
            }
            List<String> jadwal = List.generate(data!["jadwal"].length,
                (index) => data!["jadwal"][index]["jam"]);
            var isBooked = data!["jadwal"];

            return GroupButton(
              enableDeselect: true,
              // isRadio: false,
              buttons: jadwal,
              controller: GroupButtonController(
                disabledIndexes: List.generate(jadwal.length, (index) {
                  try {
                    Timestamp tgl = data["timeStamp"];
                    int a = -1.obs;

                    var comparison =
                        tgl.compareTo(Timestamp.fromDate(DateTime.now()));
                    if (comparison < 0) {
                      var format = DateFormat("HH:mm");
                      var sekarang = format.format(DateTime.now());
                      var jam = format.parse(jadwal[index]);
                      a = jam.isBefore(format.parse(sekarang)) ? index : -1;
                      if (isBooked[index]["isBooked"] == true) {
                        a = index;
                      }
                    } else if (isBooked[index]["isBooked"] == true) {
                      a = index;
                    }

                    return a;
                  } catch (e) {
                    rethrow;
                  }
                }),
              ),
              options: GroupButtonOptions(
                selectedShadow: const [],
                unselectedShadow: const [],
                unselectedColor: Colors.amber[50],
                unselectedTextStyle: TextStyle(
                  color: Colors.grey[600],
                ),
                selectedColor: primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              onSelected: (val, i, selected) {
                myCont.radioButton(val, i, selected, info);
              },
            );
          }),
    );
  }
}

class ScrollInjector extends StatelessWidget {
  const ScrollInjector({
    Key? key,
    required this.child,
    required this.groupingType,
  }) : super(key: key);

  final Widget child;
  final GroupingType groupingType;

  @override
  Widget build(BuildContext context) {
    if (groupingType == GroupingType.row) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: child,
      );
    }
    return child;
  }
}
