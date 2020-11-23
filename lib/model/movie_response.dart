import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:movie_app/model/movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final String error;

  MovieResponse(
    this.movies,
    this.error,
  );

  MovieResponse.withError(String errorValue)
      : movies = List(),
        error = errorValue;

  MovieResponse copyWith({
    List<Movie> movies,
    String error,
  }) {
    return MovieResponse(
      movies ?? this.movies,
      error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'movies': movies?.map((x) => x?.toMap())?.toList(),
      'error': error,
    };
  }

  factory MovieResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MovieResponse(
      List<Movie>.from(map['movies']?.map((x) => Movie.fromMap(x))),
      map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieResponse.fromJson(String source) => MovieResponse.fromMap(json.decode(source));

  @override
  String toString() => 'MovieResponse(movies: $movies, error: $error)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieResponse && listEquals(o.movies, movies) && o.error == error;
  }

  @override
  int get hashCode => movies.hashCode ^ error.hashCode;
}
