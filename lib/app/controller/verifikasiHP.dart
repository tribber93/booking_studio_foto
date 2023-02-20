import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:studio_foto/app/controller/authController.dart';
import 'package:studio_foto/app/modules/user/dashboard/views/send_otp_view.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

class VerifyController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  String? nomor;
  String? phoneNumber;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  sendOTP({String? phoneNumber}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        Get.to(() => SendOTPView(),
            routeName: "${Routes.ADMIN_DASHBOARD}/otp/verify",
            arguments: {"phoneNumber": phoneNumber, "verify": verificationId});
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  verifyOTP(BuildContext context, String phoneNumber, String code,
      String verify, String? currentUser) async {
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: code);
      await auth.signInWithCredential(credential);
    } catch (e) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "OTP Salah",
        text: e.toString(),
      );
      print("Gagal Bro: $e");
      return;
    }
    await db.collection('users').doc(currentUser).update({
      'phoneNumber': phoneNumber,
    }).whenComplete(
      () => QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: "Nomor Terverifikasi",
        text: "Silakan Login kembali untuk masuk",
        onConfirmBtnTap: () => AuthController().logout(),
        barrierDismissible: false,
      ),
    );
  }
}
