import 'dart:core';

class Character {
  final String name;
  final int level;
  final String job;

  Character({
    required this.name,
    required this.level,
    required this.job,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      level: json['level'],
      job: json['job'],
    );
  }
}