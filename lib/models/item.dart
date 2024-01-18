class Item {
  final String name;
  final ItemType type;
  final ItemStats stats;
  final ItemPotential? potential;
  final ItemFlame? flame;
  final ItemSoul? soul;

  Item({
    required this.name,
    required this.type,
    required this.stats,
    this.potential,
    this.flame,
    this.soul,
  });
}

class ItemStats {
  ItemType type;
  AttackSpeed? attackSpeed;
  int? str;
  int? dex;
  int? luk;
  int? maxHP;
  int? maxMP;
  int? percentHP;
  int? percentMP;
  int? att;
  int? matt;
  int? boss;
  int? ied;
  int? percentAllStat;
  int? percentDamage;

  ItemStats({
    required this.type,
    this.attackSpeed,
    this.str,
    this.dex,
    this.luk,
    this.maxHP,
    this.maxMP,
    this.percentHP,
    this.percentMP,
    this.att,
    this.matt,
    this.boss,
    this.ied,
    this.percentAllStat,
    this.percentDamage,
  });
}

class ItemPotential {
  PotentialRank? rank;
  PotentialLine? line1;
  PotentialLine? line2;
  PotentialLine? line3;
}

class ItemFlame {}

class ItemSoul {}

enum ItemType {
  weapon,
  secondary,
  emblem,
  ring,
  pendant,
  face,
  eye,
  earring,
  belt,
  hat,
  top,
  bottom,
  overall,
  shoe,
  shoulder,
  glove,
  cape,
  pocket,
  badge,
  medal,
  android,
  heart,
  totem,
}

enum AttackSpeed {
  fast,
  slow,
}

enum PotentialRank {
  rare,
  epic,
  unique,
  legendary,
}

class PotentialLine {
  PotentialRank? rank;
  int? itemLevel;
  ItemType? itemType;
  PotentialType? potentialType;
  bool? isPrime;
  String? text;
}

enum PotentialType {
  str,
  dex,
  int,
  luk,
  percentSTR,
  percentDEX,
  percentINT,
  percentLUK,
  percentAllStat,
}
