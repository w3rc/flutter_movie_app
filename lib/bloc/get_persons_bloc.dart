import 'package:movie_app/model/person_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonsListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject = BehaviorSubject<PersonResponse>();

  BehaviorSubject<PersonResponse> get subject => _subject;

  getPersons() async {
    PersonResponse _response = await _repository.getPersons();
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }
}

final personsBloc = PersonsListBloc();
