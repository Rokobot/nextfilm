import 'package:dio/dio.dart';

import '../movie_model/model_movie_toprated.dart';
Future<List<MovieTopRated>> fetchTopratedMovie() async {
  final dio = Dio();
  final String apiKey = '5c3d5ee76940e8710e1a81319e3131c9';
  final String baseUrl = 'https://api.themoviedb.org/3';

  try {
    final response = await dio.get('${baseUrl}/movie/top_rated', queryParameters: {'api_key': apiKey});
    print(response);
    if (response.statusCode == 200) {
      final List<MovieTopRated> movies = (response.data['results'] as List)
          .map((json) => MovieTopRated.fromJson(json))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load movie. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Failed to load movie exception: $e');
    throw Exception('Failed to load movie exception');
  }
}
