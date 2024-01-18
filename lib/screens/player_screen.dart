import 'package:flutter/material.dart';
import 'package:inspector/models/player.dart';
import 'package:inspector/services/firestore_service.dart';

class PlayerScreen extends StatelessWidget {
  final String id;
  const PlayerScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Player>(
        stream: FirestoreService.readPlayer(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Column(
              children: snapshot.data!.characters.map((character) {
                return Card(
                  child: Column(
                    children: [
                      Text(character.name,
                          style: const TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          Text(character.job,
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(width: 8),
                          Text(character.level.toString(),
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
