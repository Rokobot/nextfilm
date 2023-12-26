import 'package:dio/dio.dart';

import '../movie_model/model_movie..dart';

Future<List<Movie>> fetchMovies() async{
  final dio = Dio();
  final apiKey =  'aaa635b05d7f4c17163a2e3433458b5d';
  final baseUrl='https://api.themoviedb.org/3';
  
  
  try{
    final response = await dio.get('${baseUrl}/movie/popular', queryParameters:  {'api_key': apiKey});

    if(response.statusCode == 200){
      final List<Movie> movies = (response.data['results'] as List)
          .map((json) => Movie.fromJson(json) )
          .toList();
      return movies;
    }else{
      throw Exception('Failed to load movies');
    }
  }catch(e){
    throw Exception('Failed to load movie');
  }
  
}