import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inspector/models/character.dart';

class Player {
  final String id;
  final String name;
  List<Character> characters;

  Player({
    required this.id,
    required this.name,
    this.characters = const [],
  });

  void addCharacter(Character character) {
    characters.add(character);
  }

  List<Character> getCharacters() {
    return characters;
  }

  String getName() {
    return characters[0].name;
  }

  factory Player.fromID(String id) {
    return Player(
      id: id,
      name: "",
    );
  }

  factory Player.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Player(
      id: snapshot.id,
      name: data?['name'] ?? '-no name-',
      characters: _charactersFromJson(data?['characters']),
    );
  }

  static List<Character> _charactersFromJson(Map<String, dynamic> json) {
    return json.entries
        .map((character) => Character.fromJson(character.value))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "characters": charactersToJson(characters),
    };
  }

  static Map<String, dynamic> charactersToJson(List<Character> characters) {
    return Map.fromIterable(
      characters.map(
        (character) => {
          character.name: {
            "job": character.job,
            "level": character.level,
          }
        },
      ),
    );
  }
}
