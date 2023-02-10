import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/controller/verifikasiHP.dart';
import 'package:pinput/pinput.dart';
import 'package:studio_foto/utils/myColor.dart';

class SendOTPView extends GetView<VerifyController> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey();
  String phoneNumber = Get.arguments['phoneNumber'];
  String verify = Get.arguments['verify'];
  @override
  Widget build(BuildContext context) {
    String code = '';
    Get.put(VerifyController());
    const focusedBorderColor = primaryColor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: primaryColor),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Verifikasi OTP'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(30, 60, 87, 1),
        ),
      ),
      body: SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () => AuthController().logout(),
                    icon: FaIcon(FontAwesomeIcons.arrowLeft),
                    label: Text("Kembali")),
                Text(
                  "Kode OTP berhasil dikirim \nke ${phoneNumber}",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/icons/pin.png',
                  height: 200,
                ),
                const SizedBox(
                  height: 70,
                ),
                Directionality(
                  // Specify direction if desired
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 6,
                    controller: pinController,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    // validator: (value) {
                    //   return value == '2222' ? null : 'Pin is incorrect';
                    // },
                    // onClipboardFound: (value) {
                    //   debugPrint('onClipboardFound: $value');
                    //   pinController.setText(value);
                    // },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                    },
                    onChanged: (value) {
                      code = value;
                      // debugPrint('onChanged: $value');
                      print(code);
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () => controller.verifyOTP(context, phoneNumber,
                      code, verify, auth.currentUser!.email),
                  child: const Text(
                    'Verifikasi Nomor',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, letterSpacing: 1.3),
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
