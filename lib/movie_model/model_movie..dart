class Movie{
  final String title;
  final String overview;
  final String posterPath;


  Movie({required this.title , required this.overview , required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(title: json['title'], overview: json['overview'], posterPath: 'https://image.tmdb.org/t/p/w500${json['posterPath']}');
  }
}