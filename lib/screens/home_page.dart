import 'package:flutter/material.dart';
import 'package:nextfilm/helper/helper.dart';
import 'package:nextfilm/services/auth_firebase_service.dart';
import 'package:nextfilm/widgets/widgets.dart';

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
      body: Center(
        child: Text('Home page'),
      ),
      drawer: Drawer(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DrawerHeader(
              child: Container(
            width: double.infinity,
            child: Card(
              color: Colors.transparent,
              elevation: 97,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/film.png'),
              ),
            ),
          )),
          Card(
            child: ListTile(
              leading: Text(
                username.toString(),
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Text(email.toString(), style: TextStyle(fontSize: 15)),
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                    color: Colors.red,
                    child: Text(
                      'logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      replaceNextScreen(context, '/SignUpPage');
                    })),
          ),
          SizedBox(
            height: 10,
          )
        ],
      )),
    );
  }
}
