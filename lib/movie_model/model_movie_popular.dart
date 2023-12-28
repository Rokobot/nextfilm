class MoviePopular{
  final String title;
  final String overview;
  final String posterPath;


  MoviePopular({required this.title , required this.overview , required this.posterPath});

  factory MoviePopular.fromJson(Map<String, dynamic> json){
    return MoviePopular(title: json['title'], overview: json['overview'], posterPath: 'https://image.tmdb.org/t/p/w500${json['poster_path']}');
  }
}