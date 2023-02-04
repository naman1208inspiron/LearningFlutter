import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final imgUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRJ4a9bqc8dtTTjyHgnZ3dwbQvnrR2PNKo1g&usqp=CAU";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  // decoration: const BoxDecoration(
                  //   color: Colors.blue,
                  // ),
                  accountName: const Text(("Naman Sharma")),
                  accountEmail: const Text("naman@gmail.com"),
                  // currentAccountPicture: Image.network(imgUrl),
                  currentAccountPicture:
                      CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
                  margin: EdgeInsets.zero,
                )),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("My Profile",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Enail me",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
