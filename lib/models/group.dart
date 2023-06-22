import 'package:database/models/person.dart';

class Group {
  final int id;
  final String name;
  final String code;
  final String description;
  List<Person> persons;

  Group({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.persons,
  });

  factory Group.fromMap(Map<String, dynamic> json) => Group(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        description: json['description'],
        persons: json['persons'],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "code": code,
        "description": description,
        "persons": persons,
      };
}
