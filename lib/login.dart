import 'package:flutter/material.dart';
import 'package:flutter_login_firebase/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // authController.signInAnonymous();

        //authController.signInGoogle();

        authController.addToken();

        print("Anonimooo");
      }),
      body: const Center(
        child: Text("LOGIN"),
      ),
    );
  }
}
