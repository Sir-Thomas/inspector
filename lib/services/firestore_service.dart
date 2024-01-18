import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inspector/models/character.dart';
import 'package:inspector/models/player.dart';

class FirestoreService {
  FirebaseFirestore? _instance;

  Map<String, Player> _players = {};

  Map<String, Player> getPlayers() {
    return _players;
  }

  Future<void> getCharactersFromFirebase(String id) async {
    _instance = FirebaseFirestore.instance;

    CollectionReference players = _instance!.collection('players');

    DocumentSnapshot snapshot = await players.doc(id).get();
    var data = snapshot.data() as Map;
    var characters = data['characters'] as List<dynamic>;

    for (var character in characters) {
      _players[id]!.addCharacter(Character.fromJson(character));
    }
    ;
  }

  String getName() {
    String name = "";
    _players.forEach((id, Player) {
      name = Player.getName();
    });
    return name;
  }

  static createPlayer(List<Character> characters) {
    final playerCollection = FirebaseFirestore.instance.collection("players");

    String id = playerCollection.doc().id;

    final newPlayer = Player(
      id: id,
      name: '-none-',
      characters: [],
    );

    playerCollection.doc(id).set(newPlayer.toJson());
  }

  static Stream<List<Player>> readPlayers() {
    final playerCollection = FirebaseFirestore.instance.collection("players");

    //return Stream.value(["1", "2", "3"]);
    return playerCollection.snapshots().map((querySnapshot) => querySnapshot
        .docs
        .map((player) => Player.fromFirestore(player, null))
        .toList());
  }

  static Stream<Player> readPlayer(String id) {
    final playerCollection = FirebaseFirestore.instance.collection("players");

    Stream<List<Player>> playerList = playerCollection.snapshots().map(
        (querySnapshot) => querySnapshot.docs
            .map((player) => Player.fromFirestore(player, null))
            .toList());

    return playerList
        .map((players) => players.firstWhere((player) => player.id == id));
  }

  static updatePlayer(Player player) {
    final playerCollection = FirebaseFirestore.instance.collection("players");

    final playerJson = Player(
      name: player.name,
      id: player.id,
      characters: player.characters,
    ).toJson();

    playerCollection.doc(player.id).update(playerJson);
  }

  static deletePlayer(String id) {
    final playerCollection = FirebaseFirestore.instance.collection("players");

    playerCollection.doc(id).delete();
  }
}
