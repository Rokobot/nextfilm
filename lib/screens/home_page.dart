import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextfilm/bloc/bloc/auth_bloc.dart';
import 'package:nextfilm/widgets/drawer_ui.dart';

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
              child: Text('Home page'),
            ),
          ),
          drawer: Drawer(child: DrawerUI())),
    );
  }
}
