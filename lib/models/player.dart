import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inspector/models/character.dart';

class Player {
  final String id;
  final String name;
  final String character;
  final List<Character> characters = [];

  Player({required this.id, required this.character, required this.name});

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
      character: "",
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
      character: data?['character'] ?? '-no character-',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "character": character,
      "name": name,
    };
  }
}
