import 'dart:core';

import 'package:inspector/models/item.dart';

class Character {
  final String name;
  final int level;
  final String job;
  List<Item>? items;
  final String? image;

  Character({
    required this.name,
    required this.level,
    required this.job,
    this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      level: json['level'],
      job: json['job'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
      'job': job,
      // TODO - add this function 'items': items.toJson(),
      'image': image,
    };
  }
}
