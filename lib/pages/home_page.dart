import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_console/models/catalog.dart';
import 'package:flutter_console/util/routes.dart';
import 'package:flutter_console/widgets/themes.dart';

import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

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
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    // return a future ....matlab file extract karne m time lag skta hai --> that's why using await.

    final decodeData = jsonDecode(catalogJson);
    // print(decodeData);
    final productsData = decodeData["products"];
    // print(productsData);
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // context is info that which widget lies where

    // final dummylist = List.generate(25, (index) => CatalogModel.items[0]);

    // ignore: prefer_const_constructors
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Myroutes.cartRoute),
          backgroundColor: MyTheme.darkBluishColor,
          child: const Icon(CupertinoIcons.cart_fill),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().py12().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ]),
          ),
        )

        // appBar: AppBar(
        //   // backgroundColor: Colors.white,
        //   // elevation: 0.0,
        //   // iconTheme: const IconThemeData(color: Colors.black),
        //   title: const Text(
        //     "Catalog App",
        //   ),
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //       ? GridView.builder(
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             mainAxisSpacing: 20,
        //             crossAxisSpacing: 10,
        //           ),
        //           itemBuilder: (context, index) {
        //             final item = CatalogModel.items[index];
        //             return Card(
        //                 shadowColor: Colors.deepPurple,
        //                 clipBehavior: Clip.antiAlias,
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(10)),
        //                 child: GridTile(
        //                   header: Container(
        //                     child: Text(
        //                       item.name,
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.deepPurple,
        //                     ),
        //                   ),
        //                   footer: Text(item.price.toString()),
        //                   child: Image.network(item.image),
        //                 ));
        //           },
        //           itemCount: CatalogModel.items.length,
        //         )
        //       // ? ListView.builder(
        //       //     // itemCount: CatalogModel.items.length,
        //       //     itemCount: CatalogModel.items.length,
        //       //     itemBuilder: (context, index) {
        //       //       return ItemWidget(item: CatalogModel.items[index]);
        //       //       //item: CatalogModel.items[index],
        //       //     },
        //       //   )
        //       : const Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ),
        // drawer: const MyDrawer(),
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
