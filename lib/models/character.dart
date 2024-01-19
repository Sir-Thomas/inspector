import 'dart:core';

import 'package:inspector/models/item_list.dart';

class Character {
  String id;
  final String name;
  final int level;
  final String job;
  final ItemList? itemList;
  final String? imageURL;

  Character({
    required this.id,
    required this.name,
    required this.level,
    required this.job,
    this.itemList,
    this.imageURL,
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
      imageURL: '',
    );
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? json['name'],
      name: json['name'],
      level: json['level'],
      job: json['job'],
      imageURL: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? name,
      'name': name,
      'level': level,
      'job': job,
      // TODO - add this function 'items': items.toJson(),
      'image_url': imageURL,
    };
  }
}
