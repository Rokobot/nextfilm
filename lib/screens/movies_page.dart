import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nextfilm/const/consts.dart';
import 'package:nextfilm/movie_model/model_movie..dart';
import 'package:nextfilm/services/movie_repo.dart';

class moviesPage extends StatefulWidget {
  const moviesPage({super.key});

  @override
  State<moviesPage> createState() => _moviesPageState();
}

class _moviesPageState extends State<moviesPage> {
  late Future<List<Movie>> _futureMovies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureMovies = fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Movie not avaliable'),
            );
          } else {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.red,
                      width: double.infinity,
                      height: height * 0.2,
                    ),
                    Container(
                      color: backgroudnColor,
                      width: double.infinity,
                      height: height * 0.62,
                    )
                  ],
                ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length, itemBuilder: (context , index){
                        return Row(
                          children: [
                            Card(
                              elevation: 10,
                              child: Container(
                                color: backgroudnColor,
                                height: 190,
                                width: 130,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(snapshot.data![index].posterPath.toString()),
                                      Center(
                                        child: Text(snapshot.data![index].title,
                                            style: TextStyle(

                                                color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
                                      ),
                                      Text(
                                        snapshot.data![index].overview,
                                        textAlign: TextAlign.center,
                                        maxLines: 6,
                                        style: TextStyle(
                                            color: Colors.yellow, fontSize: 8, overflow: TextOverflow.fade, ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    )

                  ],
                ),
              ),
            );
          }
        });
  }
}
