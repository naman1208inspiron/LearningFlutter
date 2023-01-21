import 'dart:html';

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
          const SizedBox(
            // here it is used to give space bw the image and the text. using of padding in such case is avoided
            height: 20.0,
            // child: Text("naman"),
          ),
          const Text(
            "Swaagat (swag se)",
            style: TextStyle(
              fontSize: 24,
              color: Colors.purple,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "enter username",
                  labelText: "USER ka NAME",
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "enter password",
                  labelText: "USER ka secret PASSWORD",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: TextButton.styleFrom(),
                  child: const Text("login kro")),
            ]),
          ),
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
