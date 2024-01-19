import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inspector/models/player.dart';
import 'package:inspector/screens/character_creation_screen/character_creation_screen.dart';
import 'package:inspector/screens/login_screen.dart';
import 'package:inspector/screens/player_screen/character_card.dart';
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
          if (snapshot.hasData == false) {
            return const Center(child: Text('No user data found'));
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  ...snapshot.data!.characters.map((character) {
                    return CharacterCard(character: character);
                  }),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, CharacterCreationScreen.routeName);
                        },
                        child: const Text('Add Character'),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: const Text('Sign Out'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
