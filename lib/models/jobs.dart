import 'package:flutter/foundation.dart';

enum Jobs {
  battleMage,
  beastTamer,
  blazeWizard,
  evan,
  illium,
  kanna,
  kinesis,
  lara,
  luminous,
  firePoison,
  iceLightning,
  bishop,
  dualBlade,
  nightWalker,
  phantom,
  shadower,
  nightLord,
  xenon,
  cadena,
  hoyoung,
  khali,
  aran,
  adele,
  blaster,
  dawnWarrior,
  demonAvenger,
  demonSlayer,
  hayato,
  kaiser,
  mihile,
  zero,
  hero,
  paladin,
  darkKnight,
  marksman,
  bowmaster,
  pathfinder,
  kain,
  mercedes,
  wildHunter,
  windArcher,
  angelicBuster,
  cannoneer,
  mechanic,
  corsair,
  buccaneer,
  shade,
  thunderBreaker,
  ark,
}

extension JobToString on Jobs {
  String toFormattedString() {
    return name[0].toUpperCase() +
        name.substring(1).replaceAllMapped(
            RegExp(r'(?<=[a-z])(?=[A-Z0-9])'), (match) => ' ');
  }
}
