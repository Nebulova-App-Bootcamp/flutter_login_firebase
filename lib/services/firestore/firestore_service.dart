import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService<T> {
  String _logName = "Firestore service";

  final String collection;

  FirestoreService(this.collection);

  _logError(e) => log("Firestore error", name: _logName, error: e);

  ///GENERATE ID
  String generatedId() {
    return FirebaseFirestore.instance.collection(collection).doc().id;
  }

  ///ADD
  Future<DocumentReference> add(Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .add(data)
        .catchError((err) {
      _logError(err);
    });
  }

  ///SET
  Future<void> set(String id, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data)
        .catchError((err) => _logError(err));
  }

  ///MERGE
  Future<void> merge(String id, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data, SetOptions(merge: true))
        .catchError((err) => _logError(err));
  }
}
