import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quickalert/quickalert.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/controller/myController.dart';
import 'package:studio_foto/app/controller/verifikasiHP.dart';
import 'package:studio_foto/app/modules/user/dashboard/views/send_otp_view.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

class OTPView extends GetView<VerifyController> {
  final versC = Get.find<VerifyController>();
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyController());
    return OTP(controller: controller);
  }
}

class OTP extends StatelessWidget {
  const OTP({
    super.key,
    required this.controller,
  });
  final VerifyController controller;

  @override
  Widget build(BuildContext context) {
    String nomor = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kembali"),
        centerTitle: false,
        leading: IconButton(
          onPressed: () => AuthController().logout(),
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IntlPhoneField(
                        // disableLengthCheck: true,
                        autovalidateMode: AutovalidateMode.disabled,
                        initialCountryCode: "ID",
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        // controller: myC.nomorController,
                        onChanged: (phone) {
                          // print(phone.completeNumber);
                          nomor = phone.completeNumber;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () async {
                            // controller.formKey.currentState?.validate();
                            if (nomor.length < 12) {
                              QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  title: "Nomor tidak valid");
                              // controller.reset();
                              return;
                            }
                            // print(controller.nomor);
                            controller.sendOTP(phoneNumber: nomor);

                            // await controller.sendOTP(phoneNumber: controller.nomor);
                            // controller.reset();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
