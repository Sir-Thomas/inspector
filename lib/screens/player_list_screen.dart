import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inspector/models/player.dart';
import 'package:inspector/screens/login_screen.dart';
import 'package:inspector/screens/player_screen.dart';
import 'package:inspector/services/firestore_service.dart';

class PlayerListScreen extends StatelessWidget {
  static const routeName = '/players';

  final String cname;

  const PlayerListScreen({
    required this.cname,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => FirestoreService.createPlayer([]),
                child: const Text("Create Data"),
              ),
              const SizedBox(height: 10),
              StreamBuilder<List<Player>>(
                  stream: FirestoreService.readPlayers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.data == null) {
                      return const Center(child: Text("Data is null"));
                    } else if (snapshot.data!.isEmpty) {
                      return const Center(child: Text("No Data"));
                    }
                    final players = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: players!.map((player) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PlayerScreen(id: player.id),
                                ),
                              );
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(player.name),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: const Text("Sign Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
