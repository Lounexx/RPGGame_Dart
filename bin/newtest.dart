import 'dart:io';

import 'classes/classe.dart';
import 'enemies/wolf.dart';
import 'joueur.dart';
import 'items/weapons/sword.dart';
import 'utils/combat_system.dart';

void main(List<String> arguments) {
  List<Wolf> armyOfWolves = List.filled(5, Wolf(1));
  Joueur joueur = Joueur.start("brolrb", Classe.Warrior());
  CombatSystem combat = CombatSystem(joueur, armyOfWolves[0]);
  for (Wolf aWolf in armyOfWolves) {
    combat.opponent = aWolf;
    combat.fight();
  }
}

void giveXp(Joueur player, double xp) {
  player.xp = xp;
  print("+" + xp.toString() + "xp");
  while (player.xp >= player.xpCap) {
    player.level = player.level + 1;
    player.xp = player.xp - player.xpCap;
    player.xpCap = player.xpCap + player.level * 50;
    print("Level up!!");
    print("You are level " +
        player.level.toString() +
        " with " +
        player.xp.toString() +
        "xp/" +
        player.xpCap.toString() +
        "xp");
  }
}
