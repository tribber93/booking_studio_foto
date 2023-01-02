import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studio_foto/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  UserCredential? _userCredential;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
    print(googleUser!.email);
    // Once signed in, return the UserCredential
    await auth
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);

    //firebase
    CollectionReference users = db.collection('users');

    final cekUsers = await users.doc(googleUser.email).get();
    if (!cekUsers.exists) {
      users.doc(googleUser.email).set({
        'uid': _userCredential!.user!.uid,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'photo': googleUser.photoUrl,
        'createdAt': _userCredential!.user!.metadata.creationTime,
        'lastLoginAt': _userCredential!.user!.metadata.lastSignInTime,
      }).then((value) async {
        try {
          String temp = '';
          for (var i = 0; i < googleUser.displayName!.length; i++) {
            temp = temp + googleUser.displayName![i];
            users.doc(googleUser.email).set({
              await 'list_cari': FieldValue.arrayUnion([temp.toUpperCase()])
            }, SetOptions(merge: true));
          }
        } catch (e) {
          print(e);
        }
      });
    } else {
      users.doc(googleUser.email).update({
        'lastLoginAt': _userCredential!.user!.metadata.lastSignInTime,
      });
    }
    Get.offAllNamed(Routes.DASHBOARD);
  }

  Future logout() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
