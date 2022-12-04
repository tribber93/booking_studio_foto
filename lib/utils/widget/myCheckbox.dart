import 'package:flutter/material.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/utils/myColor.dart';

class myCheckbox extends StatelessWidget {
  const myCheckbox({
    Key? key,
    required this.controller,
    String? this.text,
  }) : super(key: key);
  final text;
  final MyController controller;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return primaryColor;
    }

    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: controller.isChecked,
          onChanged: (value) {
            controller.changeCheckbox(value);
          },
        ),
        text != null ? Text(text) : SizedBox(),
      ],
    );
  }
}
