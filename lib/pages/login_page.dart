import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: const Text(
          "Login Page is too small to test things",
          style: TextStyle(
              fontSize: 40,
              color: Colors.deepOrange,
              fontWeight: FontWeight.w900),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
