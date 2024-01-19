import 'package:flutter/material.dart';
import 'package:inspector/models/character.dart';
import 'package:inspector/screens/character_creation_screen/character_creation_screen.dart';
import 'character_image.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              CharacterImage(image: character.image),
              const SizedBox(width: 8),
              CharacterLabel(character: character),
              const Spacer(),
              IconButton(
                onPressed: () => _editCharacter(context, character),
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _editCharacter(BuildContext context, Character character) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return CharacterCreationScreen(
          character: character,
        );
      },
    ),
  );
}

class CharacterLabel extends StatelessWidget {
  const CharacterLabel({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(character.name, style: const TextStyle(fontSize: 18)),
        Row(
          children: [
            Text(character.job, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 8),
            Text(character.level.toString(),
                style: const TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }
}
