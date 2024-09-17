

import 'dart:ffi';

class MovieData {

  MovieData({
    required this.page,
    required this.results
  });
  int page;
  List<Movie> results;

  // Design factory to convert json to model
 factory MovieData.fromJson(Map<String, dynamic> json) {
   List<dynamic> parsedJsonList = json["results"];
   List<Movie> movieList = List<Movie>.from(
       parsedJsonList.map<Movie>((dynamic i) =>
          // movie factory
           Movie.fromJson(i)
       )
   );
   return MovieData(
       page: json["page"],
       results: movieList
   );
  }
}

class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.poster_path
  });

  int id;
  String title;
  String poster_path;

// Design factory to convert json to model
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id : json["id"],
        title: json["title"],
        poster_path: json["poster_path"],
    );
  }
}