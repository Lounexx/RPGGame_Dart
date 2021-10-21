import 'dart:io';

import 'classes/classe.dart';
import 'joueur.dart';
import 'items/weapons/sword.dart';
import 'utils/combat_system.dart';

void main(List<String> arguments) {
  Joueur joueur = Joueur.start("brolrb", Classe.Warrior());
  Joueur joueur2 = Joueur.start("uwu", Classe.Rogue());
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

  int chooseAction(Joueur player) {
    print("Choose an action to perform");
    String? input = stdin.readLineSync();

    return 1;
  }
}
