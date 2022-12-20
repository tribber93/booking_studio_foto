import 'package:flutter/material.dart';
import 'package:studio_foto/utils/myColor.dart';

TextTheme myTextTheme(context) => Theme.of(context).textTheme;

ThemeData myThemedata = ThemeData(
  // primaryColor: primaryColor,
  // primarySwatch: Colors.amber,

  // primaryColor: primaryColor,
  // brightness: Brightness.dark,

  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  ),
);
