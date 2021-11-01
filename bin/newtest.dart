import 'dart:io';

import 'classes/classe.dart';
import 'enemies/wolf.dart';
import 'items/consummables/health_potion.dart';
import 'items/item.dart';
import 'items/weapons/hammer.dart';
import 'items/weapons/weapon.dart';
import 'joueur.dart';
import 'items/weapons/sword.dart';
import 'utils/combat_system.dart';
import 'utils/item_displayer.dart';

void main(List<String> arguments) {
  List<Item> items = List.empty(growable: true);
  items.add(Hammer(10, 1.2, 1));
  items.add(Sword(10, 1.2, 1));
  items.add(Hammer(10, 1.2, 1));
  items.add(Sword(10, 1.2, 1));
  items.add(Hammer(10, 1.2, 1));
  items.add(Sword(10, 1.2, 1));
  items.add(Hammer(10, 1.2, 1));
  Joueur joueur = Joueur.start("davy", Classe.Warrior());
  joueur.inventory.addItem(Hammer(10, 1.2, 10));
  joueur.inventory.addItem(Hammer(100, 1.2, 10));
  joueur.inventory.addItem(Hammer(1000, 1.2, 10));
  List<Weapon> weapons = List.empty(growable: true);
  weapons.add(Hammer(1000, 1.2, 1000));
  weapons.add(Hammer(105640, 1.2, 15450));
  weapons.add(Hammer(100, 1.2, 10));
  weapons.add(Hammer(10, 1.2, 10));
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
