import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:studio_foto/utils/myColor.dart';

class MyGroupButton extends StatelessWidget {
  MyGroupButton({
    Key? key,
  }) : super(key: key);
  var hariIni = DateTime.now();

  int jamSekarang = DateTime.now().hour;
  int menitSekarang = DateTime.now().minute;

  List jadwal = [
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollInjector(
      groupingType: GroupingType.wrap,
      child: GroupButton(
        buttons: jadwal,
        controller: GroupButtonController(
          disabledIndexes: List.generate(jadwal.length, (index) {
            var format = DateFormat("HH:mm");
            var sekarang = format.format(DateTime.now());
            var jam = format.parse(jadwal[index]);
            return jam.isBefore(format.parse(sekarang)) ? index : -1;
          }),
          onDisablePressed: (index) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${[index]} is disabled')),
            );
          },
        ),
        options: GroupButtonOptions(
          selectedShadow: const [],
          unselectedShadow: const [],
          unselectedColor: Colors.amber[100],
          unselectedTextStyle: TextStyle(
            color: Colors.grey[600],
          ),
          selectedColor: primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        onSelected: (val, i, selected) =>
            debugPrint('Button: $val index: $i $selected'),
      ),
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
