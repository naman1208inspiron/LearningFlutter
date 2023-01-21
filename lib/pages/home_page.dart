import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "naman";
  @override
  Widget build(BuildContext context) {
    // context is info that which widget lies where
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days learning flutter by $name"),
        ),
      ),
      drawer: Drawer(),
    );

    // return Material(
    //   child: Center(
    //     child: Container(
    //       child: Text("Welcome to $days learning flutter by $name"),
    //     ),
    //   ),
    // );
  }
}
