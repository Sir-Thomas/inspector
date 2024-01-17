import "package:flutter/material.dart";
import "package:inspector/models/character.dart";

class CharacterScreen extends StatelessWidget {
  final Character character;

  CharacterScreen({
    required this.character,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(character.name),
            Text(character.level.toString()),
          ]
        ),
      ),
    );
  }
}