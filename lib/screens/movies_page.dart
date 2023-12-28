import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nextfilm/const/consts.dart';
import 'package:nextfilm/movie_model/model_movie_popular.dart';
import 'package:nextfilm/screens/detail_movie_page.dart';
import 'package:nextfilm/services/popular_movie_repo.dart';
import 'package:nextfilm/widgets/methods.dart';

import '../movie_model/model_movie_toprated.dart';
import '../services/top_rated_movie_repo.dart';

class moviesPage extends StatefulWidget {
  const moviesPage({super.key});

  @override
  State<moviesPage> createState() => _moviesPageState();
}

class _moviesPageState extends State<moviesPage> {
  late Future<List<MoviePopular>> _futureMoviesPopular;
  late Future<List<MovieTopRated>> _futureTopMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureMoviesPopular = fetchPopularMovies();
    _futureTopMovies = fetchTopratedMovie();

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: _futureMoviesPopular,
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
              backgroundColor: Colors.red,
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
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(alignment: Alignment.topLeft,child: Text('Popular movies', style: TextStyle(fontSize: 20, color: Colors.yellow),)),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length, itemBuilder: (context , index){
                              return GestureDetector(
                                onTap: (){
                                  print('OKKKKKKKKKKKk');
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(image: snapshot.data![index].posterPath,movieOverview: snapshot.data![index].overview,movieTitle:snapshot.data![index].title,)));
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 10,
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: backgroudnColor),
                                    height: 250,
                                    width: 130,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container( height: 150, child: Image.network(snapshot.data![index].posterPath.toString())),
                                          Center(
                                            child: Text(snapshot.data![index].title,
                                                style: TextStyle(

                                                    color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
                                          ),
                                          Text(
                                            snapshot.data![index].overview,
                                            textAlign: TextAlign.center,
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: Colors.yellow, fontSize: 8, overflow: TextOverflow.fade, ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(alignment: Alignment.topLeft,child: Text('Top rated movies', style: TextStyle(fontSize: 20, color: Colors.yellow),)),
                  ),
                          Expanded(
                            child: Container(
                              child: FutureBuilder(future: _futureTopMovies, builder: (context, snapshot){
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(child: CircularProgressIndicator(color: Colors.blue,),);
                                } else if(!snapshot.hasData || snapshot.data!.isEmpty){
                                  return Center(child: Text('Movie not avialable',style: TextStyle(color: Colors.white))) ;
                                }else if(snapshot.hasError){
                                  return Center(child: Text('Error: ${snapshot.error}',style: TextStyle(color: Colors.white)));
                                }
                                else{
                                  return ListView.builder( itemCount: snapshot.data!.length, itemBuilder: (context, index){
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(image: snapshot.data![index].posterPath, movieTitle: snapshot.data![index].title, movieOverview: snapshot.data![index].overview)));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        decoration:  BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 120,
                                                child: CircleAvatar(radius: 60, backgroundImage: Image.network(snapshot.data![index].posterPath).image),),
                                              SizedBox(width: 40,),
                                              Column(
                                                children: [
                                                  Container(width:130 ,child: Text(snapshot.data![index].title, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis))),
                                                  Container(
                                                    child: Text('IMDB: ${snapshot.data![index].vote_average.truncate()} ', style: TextStyle(fontWeight: FontWeight.bold),),),
                                                  Container(
                                                    width: 200,
                                                    child: Text('${snapshot.data![index].overview} ', textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,),)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                }
                              }),
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            );
          }
        });
  }
}

