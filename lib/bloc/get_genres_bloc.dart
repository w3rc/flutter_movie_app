import 'package:movie_app/model/genre_response.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GenresListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<GenreResponse> _subject = BehaviorSubject<GenreResponse>();

  BehaviorSubject<GenreResponse> get subject => _subject;

  getGenres() async {
    GenreResponse _response = await _repository.getGenres();
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }
}

final genresBloc = GenresListBloc();
