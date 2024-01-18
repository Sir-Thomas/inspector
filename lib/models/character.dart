import 'dart:core';

import 'package:inspector/models/item.dart';

class Character {
  final String name;
  final int level;
  final String job;
  List<Item>? items;

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
