class MovieTopRated{
  final double vote_average;
  final String title;
  final String overview;
  final String posterPath;


  MovieTopRated({required this.vote_average , required this.title, required this.overview , required this.posterPath});

  factory MovieTopRated.fromJson(Map<String, dynamic> json){
    return MovieTopRated(vote_average: json['vote_average'], title: json['title'], overview: json['overview'], posterPath: 'https://image.tmdb.org/t/p/w500${json['poster_path']}');
  }

}