import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/model/person.dart';

class GenreResponse {
  final List<Genre> genres;
  final String error;

  GenreResponse(
    this.genres,
    this.error,
  );

  GenreResponse.withError(String errorValue)
      : genres = List(),
        error = errorValue;

  GenreResponse copyWith({
    List<Genre> genres,
    String error,
  }) {
    return GenreResponse(
      genres ?? this.genres,
      error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genres': genres?.map((x) => x?.toMap())?.toList(),
      'error': error,
    };
  }

  factory GenreResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GenreResponse(
      List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x))),
      map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreResponse.fromJson(String source) => GenreResponse.fromMap(json.decode(source));

  @override
  String toString() => 'GenreResponse(genres: $genres, error: $error)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GenreResponse && listEquals(o.genres, genres) && o.error == error;
  }

  @override
  int get hashCode => genres.hashCode ^ error.hashCode;
}
