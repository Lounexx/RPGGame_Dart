import 'dart:io';

import 'classes/classe.dart';
import 'enemies/wolf.dart';
import 'items/weapons/weapon.dart';
import 'joueur.dart';
import 'items/weapons/sword.dart';
import 'utils/combat_system.dart';
import 'utils/item_displayer.dart';

void main(List<String> arguments) {
  List<Wolf> armyOfWolves = List.empty(growable: true);
  armyOfWolves.add(new Wolf(1));
  armyOfWolves.add(new Wolf(1));
  armyOfWolves.add(new Wolf(1));
  Joueur joueur = Joueur.start("brolrb", Classe.Warrior());
  joueur.inventory.addItem(Sword(10, 1.25, 1));
  List<Weapon> weapons = List.empty(growable: true);
  weapons.add(Sword(10, 2.0, 10));
  weapons.add(Sword(25, 2.2, 10));
  ItemDisplayer.displayAllWeapons(weapons);
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
