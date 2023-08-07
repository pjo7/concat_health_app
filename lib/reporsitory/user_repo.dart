import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:healthcare/models/heat_model.dart';

class UserRepo extends GetxController{
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(bpmHeart bpm) async {
    await _db.collection("heartdata").add(bpm.toJson());
  }
}