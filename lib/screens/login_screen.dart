import 'package:flutter/material.dart';
import 'package:ostad_task/screens/home_screen.dart';
import 'package:ostad_task/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sign in With Google"),
          GestureDetector(
            onTap: () {
             AuthUser().signInWithGoogle();
            },
            child: Image.asset(
              "asset/gImage.png",
              height: 50,
              width: 100,
            ),
          )
        ],
      )),
    );
  }
}
