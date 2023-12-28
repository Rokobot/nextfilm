import 'dart:ui';

import 'package:flutter/material.dart';

import '../const/consts.dart';
import '../services/repoUser.dart';


class usersPage extends StatefulWidget {
  const usersPage({super.key});

  @override
  State<usersPage> createState() => _usersPageState();
}

class _usersPageState extends State<usersPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(color: Colors.red,width: double.infinity,height: height*0.2,),
                Container(color: backgroudnColor,width: double.infinity, height: height*0.62,)
              ],
            ),
            BackdropFilter(filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5), child:userRepository().fetchUserDataFromRepo() ,)

          ],
        )
      ),
    );
  }
}
