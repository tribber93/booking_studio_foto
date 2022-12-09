import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:studio_foto/app/routes/app_pages.dart';
import 'package:studio_foto/utils/myColor.dart';
import 'package:studio_foto/utils/widget/myGroupButton.dart';

import '../controllers/admin_login_controller.dart';

class AdminLoginView extends GetView<AdminLoginController> {
  const AdminLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdminLoginView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(child: MyGroupButton()),
      ),
    );
  }
}
