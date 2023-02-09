import 'package:flutter/material.dart';
import 'package:intl/src/intl/number_format.dart';

NumberFormat Rupiah() {
  return NumberFormat.simpleCurrency(locale: "id", name: 'Rp. ');
}

class InfoPemesanan extends StatelessWidget {
  InfoPemesanan({
    Key? key,
    this.nama = '',
    this.harga = '',
    this.style = const TextStyle(
        decoration: TextDecoration.none,
        fontSize: 16,
        color: Colors.black,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400),
  }) : super(key: key);
  String nama;
  String harga;
  TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nama,
            style: style,
          ),
          Text(harga, style: style)
        ],
      ),
    );
  }
}
