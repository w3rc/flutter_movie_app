import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  BehaviorSubject<MovieResponse> get subject => _subject;

  getMovies() async {
    MovieResponse _response = await _repository.getMovies();
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }
}

final moviesBloc = MoviesListBloc();
