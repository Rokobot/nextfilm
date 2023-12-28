import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nextfilm/const/consts.dart';



class DetailPage extends StatefulWidget {
  final String image;
  final String movieTitle;
  final String movieOverview;
  DetailPage({super.key, required this.image, required this.movieTitle, required this.movieOverview});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: backgroudnColor,iconTheme: IconThemeData(color: Colors.white)),
      body: Stack(
        children: [
          Container(color: Colors.yellow,height: 230,),
          Align(alignment: Alignment.bottomCenter, child: Container(color: backgroudnColor,height: 500,)),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Container(child:  Text(widget.movieTitle, style: TextStyle(color: Colors.black, fontSize: 40, fontFamily: 'Roboto'),textAlign: TextAlign.center,),),
                Center(
                  child: Container(
                    width: 300,
                    height: 400,
                    child: Image.network(widget.image),
                  ),
                ),SizedBox(height: 10,),
                Divider(thickness: 0.3, color: Colors.white, endIndent: 40,indent: 40),
                Container(child:  Text(widget.movieOverview, style: TextStyle(color: Colors.yellow), textAlign: TextAlign.center,),),

              ],
            ),
          ),
        ],
      )
    );
  }
}
