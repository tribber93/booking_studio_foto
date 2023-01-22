import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String test = "abc";
}
