import 'dart:core';

import 'package:inspector/models/item.dart';

class Character {
  String id;
  final String name;
  final int level;
  final String job;
  List<Item>? items;
  final String? image;

  Character({
    required this.id,
    required this.name,
    required this.level,
    required this.job,
    this.image,
  });

  factory Character.createID({
    required String name,
    required int level,
    required String job,
  }) {
    return Character(
      id: name,
      name: name,
      level: level,
      job: job,
      image: '',
    );
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? json['name'],
      name: json['name'],
      level: json['level'],
      job: json['job'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? name,
      'name': name,
      'level': level,
      'job': job,
      // TODO - add this function 'items': items.toJson(),
      'image': image,
    };
  }
}
