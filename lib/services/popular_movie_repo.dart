import 'package:dio/dio.dart';

import '../movie_model/model_movie_popular.dart';

Future<List<MoviePopular>> fetchPopularMovies() async{
  final dio = Dio();
  final apiKey =  '5c3d5ee76940e8710e1a81319e3131c9';
  final baseUrl='https://api.themoviedb.org/3';


  try{
    final response = await dio.get('${baseUrl}/movie/popular', queryParameters:  {'api_key': apiKey});

    if(response.statusCode == 200){
      final List<MoviePopular> movies = (response.data['results'] as List)
          .map((json) => MoviePopular.fromJson(json) )
          .toList();
      return movies;
    }else{
      throw Exception('Failed to load movies');
    }
  }catch(e){
    throw Exception('Failed to load movie');
  }

}