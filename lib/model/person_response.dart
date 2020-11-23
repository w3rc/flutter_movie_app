import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:movie_app/model/person.dart';

class PersonResponse {
  final List<Person> persons;
  final String error;

  PersonResponse(
    this.persons,
    this.error,
  );

  PersonResponse.withError(String errorValue)
      : persons = List(),
        error = errorValue;

  PersonResponse copyWith({
    List<Person> persons,
    String error,
  }) {
    return PersonResponse(
      persons ?? this.persons,
      error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'persons': persons?.map((x) => x?.toMap())?.toList(),
      'error': error,
    };
  }

  factory PersonResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PersonResponse(
      List<Person>.from(map['persons']?.map((x) => Person.fromMap(x))),
      map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonResponse.fromJson(String source) => PersonResponse.fromMap(json.decode(source));

  @override
  String toString() => 'PersonResponse(persons: $persons, error: $error)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PersonResponse && listEquals(o.persons, persons) && o.error == error;
  }

  @override
  int get hashCode => persons.hashCode ^ error.hashCode;
}
