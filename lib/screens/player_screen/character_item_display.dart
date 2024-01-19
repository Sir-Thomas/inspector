import 'package:flutter/material.dart';
import 'package:inspector/models/character.dart';
import 'package:inspector/models/item_types.dart';
import 'package:inspector/screens/player_screen/item_display.dart';

class CharacterItemDisplay extends StatelessWidget {
  final Character character;

  const CharacterItemDisplay({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (40) * 6,
      width: (40) * 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemDisplay(item: Totem(name: 'Totem', imageURL: '1202239')),
              ItemDisplay(item: Totem(name: 'Totem', imageURL: '1202239')),
              ItemDisplay(item: Totem(name: 'Totem', imageURL: '1202239')),
              const ItemDisplay(item: null),
              const ItemDisplay(item: null),
              const ItemDisplay(item: null),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemDisplay(item: Ring(name: 'Ring', imageURL: '1113075')),
              ItemDisplay(item: Ring(name: 'Ring', imageURL: '1113075')),
              ItemDisplay(item: Ring(name: 'Ring', imageURL: '1113075')),
              ItemDisplay(item: Ring(name: 'Ring', imageURL: '1113075')),
              ItemDisplay(item: Pocket(name: 'Pocket', imageURL: '1162025')),
              const ItemDisplay(item: null),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const ItemDisplay(item: null),
              ItemDisplay(item: Pendant(name: 'Pendant', imageURL: '1122267')),
              ItemDisplay(item: Pendant(name: 'Pendant', imageURL: '1122267')),
              ItemDisplay(item: Weapon(name: 'Weapon', imageURL: '1382259')),
              ItemDisplay(item: Belt(name: 'Belt', imageURL: '1132246')),
              const ItemDisplay(item: null),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemDisplay(item: Hat(name: 'Hat', imageURL: '1005568')),
              ItemDisplay(item: Face(name: 'Face', imageURL: '1012438')),
              ItemDisplay(item: Eye(name: 'Eye', imageURL: '1022277')),
              ItemDisplay(item: Top(name: 'Top', imageURL: '1042411')),
              ItemDisplay(item: Bottom(name: 'Bottom', imageURL: '1062272')),
              ItemDisplay(item: Shoe(name: 'Shoe', imageURL: '1073032')),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const ItemDisplay(item: null),
              const ItemDisplay(item: null),
              ItemDisplay(item: Earring(name: 'Earring', imageURL: '1032223')),
              ItemDisplay(
                  item: Shoulder(name: 'Shoulder', imageURL: '1152176')),
              ItemDisplay(item: Glove(name: 'Glove', imageURL: '1082637')),
              ItemDisplay(item: Android(name: 'Android', imageURL: '1662007')),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemDisplay(item: Emblem(name: 'Emblem', imageURL: '1190601')),
              ItemDisplay(item: BadgeItem(name: 'Badge', imageURL: '1182087')),
              ItemDisplay(item: Medal(name: 'Medal', imageURL: '1142879')),
              ItemDisplay(
                  item: Secondary(name: 'Secondary', imageURL: '1092089')),
              ItemDisplay(item: Cape(name: 'Cape', imageURL: '1102794')),
              ItemDisplay(item: Heart(name: 'Heart', imageURL: '1672079')),
            ],
          ),
        ],
      ),
    );
  }
}
