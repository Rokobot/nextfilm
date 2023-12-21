import 'dart:ui';
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
  String? username;
  String? email;
  @override
  void initState() {
    // TODO: implement initState
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSignOut) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            return replaceNextScreen(context, '/SignInPage');
          });
        }
        return drawerMethod(context);
      },
    );
    ;
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
                    height: 1550,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/film.jpg'),
                      ),
                    ))),
            Divider(
              indent: 50,
              endIndent: 50,
              thickness: 0.5,
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
                    username.toString().toUpperCase().substring(0, 1),
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                ),
                title: Text(
                  username.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(email.toString()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
                      onPressed: () async {
                        context.read<AuthBloc>().add(SignOutEvent());
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
