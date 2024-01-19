import 'package:flutter/material.dart';
import 'package:inspector/models/character.dart';
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
              Column(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
