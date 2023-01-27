import 'package:flutter/material.dart';
import 'package:flutter_console/pages/home_page.dart';
import 'package:flutter_console/pages/login_page.dart';
import 'package:flutter_console/util/routes.dart';
import 'package:flutter_console/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_console/widgets/themes.dart';

void main() {
  // --> entry point
  runApp(const MyApp()); // MyApp --> name of app
}

class MyApp extends StatelessWidget {
  // stateless widget se screeen m koi change nii aata hai. prui ki puri screen hi change ho jati hai.
  // MyApp --> class
  const MyApp({super.key}); // constructor.

  @override
  Widget build(BuildContext context) {
    // build k andar ui ka kaam hota hai

    return MaterialApp(
      // return m app deni padti hai .. may be widget app, material app or cupertino app
      // home: Homepage(),
      // debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // intitalroute se bhi starting page specify kr skte hai.
      initialRoute: "/home",
      routes: {
        "/": (context) =>
            const LoginPage(), // slash ka default meaning home page hi hota hai ..isliye upar home wale ko comment kar diya
        Myroutes.homeRoute: (context) => Homepage(),
        Myroutes.loginRoute: (context) => const LoginPage()
        // "/home": (context) => Homepage(),
        // "/login": (context) =>
        //     const LoginPage() // here loginpage is a object , uske aage new bhi laga skte hai
      },
    );
  }
}

/*
num temp = 30.5; // num can take both int and double
var day = "tuesday"; // var can take any datatype
const pi = 3.14; // constant value...will never change.
*/