import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<User> signInAnonymous() async {
    UserCredential result = await _auth.signInAnonymously();

    print(result.user!.isAnonymous);

    return result.user!;
  }

  Future<User?> signInGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential result = await _auth.signInWithCredential(credential);

      print(result.user!.displayName);
      print(result.user!.email);
      print(result.user!.photoURL);
      print(result.user!.uid);

      return result.user;
    }

    return null;
  }

  Future<void> addToken() async {
    _firebaseMessaging.getToken().then((token) {
      saveTokens(token);
    });
  }

  Future<void> saveTokens(var token) async {
    try {
      await _db.collection('tokensExample').doc(token).set(
        {'token': token, 'admin': true, 'uid': "Holaaa"},
      );
    } catch (e) {
      print(e);
    }
  }
}
