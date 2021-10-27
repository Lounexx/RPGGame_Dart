import 'dart:io';

import 'classes/classe.dart';
import 'enemies/wolf.dart';
import 'items/weapons/hammer.dart';
import 'items/weapons/weapon.dart';
import 'joueur.dart';
import 'items/weapons/sword.dart';
import 'utils/combat_system.dart';

void main(List<String> arguments) {
  List<Wolf> armyOfWolves = List.empty(growable: true);
  armyOfWolves.add(Wolf(1));
  armyOfWolves.add(Wolf(1));
  armyOfWolves.add(Wolf(1));
  Joueur joueur = Joueur.start("Lounexx", Classe.Warrior());
  Wolf wolf = Wolf(3);
  CombatSystem combatSystem = CombatSystem(joueur, wolf);
  combatSystem.fight();
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
