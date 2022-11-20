import 'package:flutter/material.dart';

void main() {
  // --> entry point
  runApp(MyApp()); // MyApp --> name of app
}

class MyApp extends StatelessWidget {
  // MyApp --> class
  const MyApp({super.key}); // constructor.

  @override
  Widget build(BuildContext context) {
    // build k andar ui ka kaam hota hai
    return MaterialApp(
      // return m app deni padti hai .. may be widget app, material app or cupertino app
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to learning flutter"),
          ),
        ),
      ),
    );
  }
}
