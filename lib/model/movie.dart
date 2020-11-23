import 'dart:convert';

class Movie {
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  Movie(
    this.id,
    this.popularity,
    this.title,
    this.backPoster,
    this.poster,
    this.overview,
    this.rating,
  );

  Movie copyWith({
    int id,
    double popularity,
    String title,
    String backPoster,
    String poster,
    String overview,
    double rating,
  }) {
    return Movie(
      id ?? this.id,
      popularity ?? this.popularity,
      title ?? this.title,
      backPoster ?? this.backPoster,
      poster ?? this.poster,
      overview ?? this.overview,
      rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'popularity': popularity,
      'title': title,
      'backPoster': backPoster,
      'poster': poster,
      'overview': overview,
      'rating': rating,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Movie(
      map['id'],
      map['popularity'],
      map['title'],
      map['backPoster'],
      map['poster'],
      map['overview'],
      map['rating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(id: $id, popularity: $popularity, title: $title, backPoster: $backPoster, poster: $poster, overview: $overview, rating: $rating)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Movie &&
      o.id == id &&
      o.popularity == popularity &&
      o.title == title &&
      o.backPoster == backPoster &&
      o.poster == poster &&
      o.overview == overview &&
      o.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      popularity.hashCode ^
      title.hashCode ^
      backPoster.hashCode ^
      poster.hashCode ^
      overview.hashCode ^
      rating.hashCode;
  }
}
