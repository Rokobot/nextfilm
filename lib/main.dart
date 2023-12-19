import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextfilm/bloc/bloc/auth_bloc.dart';
import 'package:nextfilm/const/consts.dart';
import 'package:nextfilm/helper/helper.dart';
import 'package:nextfilm/screens/auth/sigin_page.dart';
import 'package:nextfilm/screens/auth/signup_page.dart';
import 'package:nextfilm/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool user = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HelperFunction().checkDataFromSf().then((value) {
      setState(() {
        user = value;
        print(user);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: backgroudnColor),
        routes: {
          '/HomePage': (context) => const HomePage(),
          '/SignInPage': (context) => const SignInPage(),
          '/SignUpPage': (context) => const SignUpPage(),
        },
        home: Scaffold(
          backgroundColor: Colors.white,
          body: user ? HomePage() : SignUpPage(),
        ),
      ),
    );
  }
}
