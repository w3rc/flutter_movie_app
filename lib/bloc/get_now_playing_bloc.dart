import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  BehaviorSubject<MovieResponse> get subject => _subject;

  getNowPlaying() async {
    MovieResponse _response = await _repository.getPlayingMovies();
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }
}

final nowPlayingMoviesBloc = NowPlayingListBloc();
