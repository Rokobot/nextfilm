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

        bottomNavigationBar: BottomNavigationBar(
          onTap: (value){
            setState(() {
              pageIndex = value;
            });

            print(pageIndex);

          },
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.drive_file_move, color: Colors.red,), label: 'move'
        ),
            BottomNavigationBarItem(icon: Icon(Icons.verified_user_sharp, color: Colors.grey,),label: 'user'),
          ],
        ),
      ),
    );
  }
}
