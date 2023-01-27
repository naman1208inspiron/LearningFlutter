import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_console/models/catalog.dart';
import 'package:flutter_console/widgets/drawer.dart';
import 'dart:convert';

import '../widgets/items_widget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
  final String name = "naman";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // return a future ....matlab file extract karne m time lag skta hai --> that's why using await.
    // print(catalogJson);
    final decodeData = jsonDecode(catalogJson);
    // print(decodeData);
    final productsData = decodeData["products"];
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // context is info that which widget lies where

    final dummylist = List.generate(25, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Catalog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          // itemCount: CatalogModel.items.length,
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummylist[index]);
            //item: CatalogModel.items[index],
          },
        ),
      ),
      drawer: MyDrawer(),
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
