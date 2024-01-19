import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inspector/models/character.dart';

class Player {
  final String? name;
  List<Character> characters;

  Player({
    this.name,
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

  factory Player.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Player(
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
      'characters': charactersToJson(characters),
    };
  }

  static Map<String, dynamic> charactersToJson(List<Character> characters) {
    return {
      for (var character in characters)
        character.name: {
          'name': character.name,
          'job': character.job,
          'level': character.level
        }
    };
  }
}
