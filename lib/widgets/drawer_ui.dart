import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextfilm/bloc/bloc/auth_bloc.dart';
import 'package:nextfilm/const/consts.dart';
import 'package:nextfilm/helper/helper.dart';
import 'package:nextfilm/services/auth_firebase_service.dart';
import 'package:nextfilm/widgets/methods.dart';

class DrawerUI extends StatefulWidget {
  DrawerUI({super.key});

  @override
  State<DrawerUI> createState() => _DrawerUIState();
}

class _DrawerUIState extends State<DrawerUI> {
  String username = '';
  String  email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthFirebaseService(email: '', password: '',username: '').currentUserData().then((value) {
      setState(() {
        username = value['username'];
        email = value['email'];
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return drawerMethod(context);
      },
    );

  }

  Container drawerMethod(BuildContext context) {
    return Container(
      color: backgroudnColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerHeader(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                    ),
                    width: 150,
                    height: 150,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8 , sigmaY: 8),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/film.jpg'),
                      ),
                    ))),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 0.2,
              color: Colors.white,
            ),
            Card(
              elevation: 30,
              shadowColor: Colors.blue,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: backgroudnColor,
                  radius: 23,
                  child: Text(
                    username.toString()=='' ? 'loading...':username.toString().substring(0,1).toUpperCase() ?? 'O',
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                ),
                title: Text(
                  username.toString()=='' ? 'loading...':username.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(email.toString()=='' ? 'loading...':email.toString()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Dark',style: TextStyle(color: Colors.white),),
              SizedBox(width: 10,),
              Switch(value: true, onChanged: (value){})
            ],),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                      child: Text(
                        'logout',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: ()  {
                        context.read<AuthBloc>().add(SignOutEvent( context: context));
                      })),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}


