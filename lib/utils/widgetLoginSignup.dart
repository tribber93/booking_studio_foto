import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BgLoginSignup extends StatelessWidget {
  const BgLoginSignup({
    Key? key,
    required this.isi,
  }) : super(key: key);

  final Widget isi;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.2, 0.8, 1],
          colors: [
            Color.fromARGB(255, 248, 222, 181),
            Colors.white,
            Colors.white,
            Color.fromARGB(255, 248, 222, 181),
          ],
        )),
        child: Center(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: SizedBox(
                  width: double.infinity,
                  child: isi,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  String? label;
  String? Function(String?)? validator;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  int? maxLines;

  MyTextField({
    Key? key,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.label,
    this.validator,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          enableSuggestions: enableSuggestions,
          autocorrect: autocorrect,
          maxLines: maxLines,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 248, 222, 181), width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            labelText: label,
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
