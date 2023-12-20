import 'package:flutter/material.dart';
import 'package:nextfilm/helper/helper.dart';
import 'package:nextfilm/widgets/drawer_ui.dart';

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
        email = value['email'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('Home page'),
          ),
        ),
        drawer: Drawer(
            child: DrawerUI(
          username: username.toString(),
          email: email.toString(),
        )));
  }
}
