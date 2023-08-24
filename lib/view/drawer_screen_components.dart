import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latest_news_app/view/category_screen.dart';
import 'package:latest_news_app/view/us_technology_news_screen.dart';

class DraweScreen extends StatefulWidget {
  const DraweScreen({super.key});

  @override
  State<DraweScreen> createState() => _DraweScreenState();
}

class _DraweScreenState extends State<DraweScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text(
                    "Shahbaz Zulfiqar",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("shahbazzulfiqar977@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text(' News Category '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const CategoryScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.abc),
                title: const Text(' Us Technology News '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const WraNewsScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text(' Latest Update '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

    );
  }
}
