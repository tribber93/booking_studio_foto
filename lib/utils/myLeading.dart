import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

Widget myLeading = IconButton(
  onPressed: () {
    Get.offNamed(Routes.DASHBOARD);
  },
  icon: const Icon(FontAwesomeIcons.arrowLeft),
);
