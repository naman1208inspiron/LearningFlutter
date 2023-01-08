import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_page.png", fit: BoxFit.cover),
          Text(
            "Welcome",
            style: TextStyle(
                fontSize: 22,
                color: Colors.purple,
                fontWeight: FontWeight.w900,
                ),
          )
        ],
      ),

      // child: Center(
      //   child: const Text(
      //     "Login Page is too small to test things",
      //     style: TextStyle(
      //         fontSize: 40,
      //         color: Colors.deepOrange,
      //         fontWeight: FontWeight.w900)
      //   ),
      // ),
    );
  }
}
