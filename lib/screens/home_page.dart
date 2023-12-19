import 'package:flutter/material.dart';
import 'package:nextfilm/helper/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  String? email;
  @override
  void initState() {
    super.initState();
    HelperFunction().getDataFromSF().then((value) {
      setState(() {
        username = value['username'];
        print(value['username']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home page'),
      ),
      drawer: Drawer(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DrawerHeader(
              child: Container(
            height: 100,
            width: 100,
            child: CircleAvatar(
              child: Image.asset('assets/film.png'),
            ),
          )),
          Card(
            child: ListTile(
              leading: Text(username.toString()),
            ),
          )
        ],
      )),
    );
  }
}
