import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextfilm/bloc/bloc/auth_bloc.dart';
import 'package:nextfilm/widgets/drawer_ui.dart';

import '../services/repoUser.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child:userRepository().fetchUserDataFromRepo()
            ),
          ),
          drawer: Drawer(child: DrawerUI()),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.drive_file_move, ), label: 'move'
        ),
            BottomNavigationBarItem(icon: Icon(Icons.verified_user_sharp),label: 'move'),

          ],
        ),
      ),
    );
  }
}
