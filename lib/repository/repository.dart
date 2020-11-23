import 'package:dio/dio.dart';
import 'package:movie_app/model/genre_response.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/person_response.dart';

class MovieRepository {
  final String apiKey = "<<apikey>>";
  static String mainUrl = "https://api.themoviedb.org/3";

  final Dio _dio = Dio();

  var getPopularUrl = "$mainUrl/movie/top_rated";
  var getMoviesUrl = "$mainUrl/discover/movie";
  var getPlayingUrl = "$mainUrl/movie/now_playing";
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPersonsUrl = "$mainUrl/trending/person/week";

  Future<MovieResponse> getMovies() async {
    var params = {
      "apiKey": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response _response = await _dio.get(
        getPopularUrl,
        queryParameters: params,
      );
      return MovieResponse.fromJson(_response.data);
    } catch (e) {
      return MovieResponse.withError(e);
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {
      "apiKey": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response _response = await _dio.get(
        getPlayingUrl,
        queryParameters: params,
      );
      return MovieResponse.fromJson(_response.data);
    } catch (e) {
      return MovieResponse.withError(e);
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {
      "apiKey": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response _response = await _dio.get(
        getGenresUrl,
        queryParameters: params,
      );
      return GenreResponse.fromJson(_response.data);
    } catch (e) {
      return GenreResponse.withError(e);
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      "apiKey": apiKey,
      "language": "en-US",
      "page": 1,
    };
    try {
      Response _response = await _dio.get(
        getPersonsUrl,
        queryParameters: params,
      );
      return PersonResponse.fromJson(_response.data);
    } catch (e) {
      return PersonResponse.withError(e);
    }
  }

  Future<MovieResponse> getMoviesByGenre(int id) async {
    var params = {
      "apiKey": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id,
    };
    try {
      Response _response = await _dio.get(
        getMoviesUrl,
        queryParameters: params,
      );
      return MovieResponse.fromJson(_response.data);
    } catch (e) {
      return MovieResponse.withError(e);
    }
  }
}
