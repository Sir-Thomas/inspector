import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inspector/models/character.dart';
import 'package:inspector/models/jobs.dart';
import 'package:inspector/screens/player_screen/player_screen.dart';
import 'package:inspector/services/firestore_service.dart';
import 'package:inspector/widgets/autocomplete_container_widget.dart';
import 'package:inspector/widgets/form_container_widget.dart';
import 'package:provider/provider.dart';

class CharacterCreationScreen extends StatefulWidget {
  static const routeName = '/create_character';

  final Character? character;

  const CharacterCreationScreen({super.key, this.character});

  @override
  State<CharacterCreationScreen> createState() =>
      _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<CharacterCreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();

  String? _job;
  String? id;

  @override
  void initState() {
    if (widget.character != null) {
      _nameController.text = widget.character!.name;
      _levelController.text = widget.character!.level.toString();
      _job = widget.character!.job;
      id = widget.character!.id;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String playerID = Provider.of<User>(context).uid;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Character',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _nameController,
                hintText: 'Character Name',
                isPasswordField: false,
              ),
              const SizedBox(height: 10),
              FormContainerWidget(
                controller: _levelController,
                hintText: 'Level',
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              AutocompleteContainerWidget(
                initialValue: _job ?? 'Job',
                options:
                    Jobs.values.map((job) => job.toFormattedString()).toList(),
                onSelected: (job) {
                  setState(() {
                    _job = job;
                  });
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _createCharacter(
                        playerID,
                        id ?? _nameController.text,
                        _nameController.text,
                        _job ?? 'none',
                        int.parse(_levelController.text),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerScreen(
                                id: Provider.of<User>(context).uid)),
                        (route) => false,
                      );
                    },
                    child: const Text('Create Character'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () => _removeCharacter(
                      context,
                      playerID,
                      id ?? _nameController.text,
                    ),
                    child: const Text('Delete Character'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _createCharacter(
  String playerID,
  String id,
  String name,
  String job,
  int level,
) async {
  var player = await FirestoreService.readPlayer(playerID).first;
  player.addCharacter(Character(
    id: id,
    name: name,
    level: level,
    job: job,
  ));
  FirestoreService.updatePlayer(playerID, player);
}

void _removeCharacter(
    BuildContext context, String playerID, String characterID) {
  FirestoreService.removeCharacter(playerID, characterID);
  Navigator.pop(context);
}
