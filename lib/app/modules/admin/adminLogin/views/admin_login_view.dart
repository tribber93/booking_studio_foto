// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:group_button/group_button.dart';
// import 'package:studio_foto/app/routes/app_pages.dart';
// import 'package:studio_foto/utils/myColor.dart';
// import 'package:studio_foto/utils/widget/myGroupButton.dart';

// import '../controllers/admin_login_controller.dart';

// class AdminLoginView extends GetView<AdminLoginController> {
//   const AdminLoginView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AdminLoginView'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Center(child: MyGroupButton()),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AdminLoginView extends StatefulWidget {
  @override
  _AdminLoginViewState createState() => _AdminLoginViewState();
}

class _AdminLoginViewState extends State<AdminLoginView> {
  String? _jam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pilih jam:'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _jam == 'jam1' ? Colors.blue : Colors.grey[200]),
              child: Text(
                'Jam 1',
                style: TextStyle(
                    color: _jam == 'jam1' ? Colors.white : Colors.black),
              ),
              onPressed: () {
                setState(() {
                  _jam = 'jam1';
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _jam == 'jam2' ? Colors.blue : Colors.grey[200]),
              child: Text(
                'Jam 2',
                style: TextStyle(
                    color: _jam == 'jam2' ? Colors.white : Colors.black),
              ),
              onPressed: () {
                setState(() {
                  _jam = 'jam2';
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _jam == 'jam3' ? Colors.blue : Colors.grey[200]),
              child: Text(
                'Jam 3',
                style: TextStyle(
                    color: _jam == 'jam3' ? Colors.white : Colors.black),
              ),
              onPressed: () {
                setState(() {
                  _jam = 'jam3';
                });
              },
            ),
            Text('Jam yang dipilih: $_jam'),
          ],
        ),
      ),
    );
  }
}
