import 'package:inspector/models/item.dart';
import 'package:inspector/models/item_types.dart';

class ItemList {
  final List<Totem> totems;
  final List<Ring> rings;
  final Pocket pocket;
  final List<Pendant> pendants;
  final Weapon weapon;
  final Belt belt;
  final Hat hat;
  final Face face;
  final Eye eye;
  final Top top;
  final Bottom? bottom;
  final Shoe shoe;
  final Earring earring;
  final Shoulder shoulder;
  final Glove glove;
  final Android android;
  final Emblem emblem;
  final BadgeItem badgeItem;
  final Medal medal;
  final Secondary secondary;
  final Cape cape;
  final Heart heart;

  ItemList({
    required this.totems,
    required this.rings,
    required this.pocket,
    required this.pendants,
    required this.weapon,
    required this.belt,
    required this.hat,
    required this.face,
    required this.eye,
    required this.top,
    required this.bottom,
    required this.shoe,
    required this.earring,
    required this.shoulder,
    required this.glove,
    required this.android,
    required this.emblem,
    required this.badgeItem,
    required this.medal,
    required this.secondary,
    required this.cape,
    required this.heart,
  });

  factory ItemList.fromJSON(Map<String, dynamic> json) {
    return ItemList(
      totems: json['totems'],
      rings: json['rings'],
      pocket: json['pocket'],
      pendants: json['pendants'],
      weapon: json['weapon'],
      belt: json['belt'],
      hat: json['hat'],
      face: json['face'],
      eye: json['eye'],
      top: json['top'],
      bottom: json['bottom'],
      shoe: json['shoe'],
      earring: json['earring'],
      shoulder: json['shoulder'],
      glove: json['glove'],
      android: json['android'],
      emblem: json['emblem'],
      badgeItem: json['badgeItem'],
      medal: json['medal'],
      secondary: json['secondary'],
      cape: json['cape'],
      heart: json['heart'],
    );
  }

  List<Item> _itemListFromJSON(Map<String, dynamic> json) {
    List<Item> list;
    json.map(
      (key, value) => list.add(
        _itemFromJSON(value),
      ),
    );
  }
}
