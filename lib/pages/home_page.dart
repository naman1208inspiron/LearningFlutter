import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_console/models/catalog.dart';
import 'package:flutter_console/widgets/drawer.dart';
import 'package:flutter_console/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
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
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CatalogHeader(),
          if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            CatalogList().expand()
          else
            Center(
              child: CircularProgressIndicator(),
            )
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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl3.bold.color(MyTheme.darkBluishColor).make(),
      "Treding Products".text.xl2.color(MyTheme.darkBluishColor).make(),
    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Buy".text.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).blue100.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
