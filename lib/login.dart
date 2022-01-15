import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_firebase/controllers/auth_controller.dart';
import 'package:flutter_login_firebase/models/user_model.dart';
import 'package:flutter_login_firebase/services/firestore/firestore_service.dart';
import 'package:get/get.dart';

import 'services/firestore/firestore_service_users.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String generatedId() {
      return FirebaseFirestore.instance.collection("collection").doc().id;
    }

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) => Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          // authController.signInAnonymous();

          // authController.signInGoogle();
          UserModel authModel =
              await DatabaseUsers().getUser("gVHNHwFyOCVzmsEkVdwIXks8Os42");

          print(authModel.name);
          print(authModel.email);

          //authController.addToken();

          //print(generatedId());

          //FirestoreService("collection").add({'data1': true, 'data2': false});

          // FirestoreService("collection").set("Lq3odi5dcXBpolwO4yN4", {
          //   'otrodato': true,
          //   'tengomasdatos': true,
          // });
        }),
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (authController.firestoreUser.value != null &&
                      authController.firestoreUser.value!.name != null)
                  ? Text(authController.firestoreUser.value!.name!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
