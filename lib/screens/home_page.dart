import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextfilm/bloc/bloc/auth_bloc.dart';
import 'package:nextfilm/const/consts.dart';
import 'package:nextfilm/screens/movies_page.dart';
import 'package:nextfilm/screens/users_page.dart';
import 'package:nextfilm/widgets/drawer_ui.dart';

import '../services/repoUser.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
          appBar: AppBar(backgroundColor: backgroudnColor,          iconTheme: IconThemeData(color: Colors.white),
          ),
          body: SafeArea(
            child: Center(
              child: pageIndex == 0?  moviesPage(): usersPage()
            ),
          ),
          drawer: Drawer(child: DrawerUI()),

        bottomNavigationBar: CustomNavigationBar(
          onTap: (value){
            setState(() {
              pageIndex = value;
            });

            print(pageIndex);

          },
          backgroundColor: Colors.black,
          items: [
            CustomNavigationBarItem(
              icon: pageIndex == 0
                  ? Icon(Icons.drive_file_move, color: Colors.red)
                  : Icon(Icons.drive_file_move, color: Colors.white),
              selectedIcon: pageIndex == 0
                  ? Icon(Icons.drive_file_move, color: Colors.red)
                  : Icon(Icons.drive_file_move, color: Colors.white),
              title: pageIndex == 0
                  ? Text('movie', style: TextStyle(color: Colors.red))
                  : Text('movie', style: TextStyle(color: Colors.white)),
              selectedTitle: pageIndex == 0
                  ? Text('movie', style: TextStyle(color: Colors.red))
                  : Text('movie', style: TextStyle(color: Colors.white)),
            ),
            CustomNavigationBarItem(
              icon: pageIndex == 1
                  ? Icon(Icons.verified_user_sharp, color: Colors.red)
                  : Icon(Icons.verified_user_sharp, color: Colors.white),
              selectedIcon: pageIndex == 1
                  ? Icon(Icons.verified_user_sharp, color: Colors.red)
                  : Icon(Icons.verified_user_sharp, color: Colors.white),
              title: pageIndex == 1
                  ? Text('users', style: TextStyle(color: Colors.red))
                  : Text('users', style: TextStyle(color: Colors.white)),
              selectedTitle: pageIndex == 1
                  ? Text('users', style: TextStyle(color: Colors.red))
                  : Text('users', style: TextStyle(color: Colors.white)),
            ),

          ],
        ),
      ),
    );
  }
}
