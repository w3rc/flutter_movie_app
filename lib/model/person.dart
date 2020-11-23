import 'dart:convert';

class Person {
  final int id;
  final String name;
  final double popularity;
  final String profileImage;
  final String known;
  Person({
    this.id,
    this.name,
    this.popularity,
    this.profileImage,
    this.known,
  });
  

  Person copyWith({
    int id,
    String name,
    double popularity,
    String profileImage,
    String known,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      popularity: popularity ?? this.popularity,
      profileImage: profileImage ?? this.profileImage,
      known: known ?? this.known,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'popularity': popularity,
      'profileImage': profileImage,
      'known': known,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Person(
      id: map['id'],
      name: map['name'],
      popularity: map['popularity'],
      profileImage: map['profileImage'],
      known: map['known'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Person(id: $id, name: $name, popularity: $popularity, profileImage: $profileImage, known: $known)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Person &&
      o.id == id &&
      o.name == name &&
      o.popularity == popularity &&
      o.profileImage == profileImage &&
      o.known == known;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      popularity.hashCode ^
      profileImage.hashCode ^
      known.hashCode;
  }
}
