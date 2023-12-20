import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nextfilm/const/consts.dart';

class DrawerUI extends StatefulWidget {
  String username;
  String email;
  DrawerUI({super.key, required this.username, required this.email});

  @override
  State<DrawerUI> createState() => _DrawerUIState();
}

class _DrawerUIState extends State<DrawerUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroudnColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 100,
              child: Container(
                  color: Colors.blue,
                  width: 140,
                  height: 140,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 25),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/film.jpg'),
                    ),
                  )),
            )),
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
                    widget.username.toString().toUpperCase().substring(0, 1),
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                ),
                title: Text(
                  widget.username.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.email.toString()),
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
                      onPressed: () {})),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
    ;
  }
}
