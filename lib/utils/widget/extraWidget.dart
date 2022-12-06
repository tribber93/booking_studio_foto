import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/controller/myController.dart';

class ExtraWidget extends StatelessWidget {
  ExtraWidget({
    required this.info,
    Key? key,
  }) : super(key: key);

  final info;

  @override
  Widget build(BuildContext context) {
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
                        var _infoCheck = info.elementAt(index);
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: _infoCheck["isCheck"],
                          onChanged: (value) {
                            myController.checkbox(value, index, info);
                            debugPrint(
                                "nilai ${_infoCheck["extra"]} ${_infoCheck["isCheck"]}");
                            myController.update();
                          },
                          title: Text(
                            _infoCheck["extra"],
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
