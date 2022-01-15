import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login_firebase/models/user_model.dart';
import 'package:flutter_login_firebase/services/firestore/firestore_service.dart';

class DatabaseUsers {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _collection = "usersExamples";
  static final FirestoreService _service = FirestoreService(_collection);

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection(_collection).doc(user.uid!).set(
        {
          "uid": user.uid,
          "email": user.email,
        },
        SetOptions(merge: true),
      );
      return true;
    } catch (e) {
      log("$e");
      return false;
    }
  }

  static mergeUsereData(UserModel user) {
    Map<String, dynamic> data = {
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "photoUrl": user.photoUrl
    };
    _service.merge(user.uid!, data);
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(_collection).doc(uid).get();

      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
}
