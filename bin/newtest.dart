import 'classes/classe.dart';
import 'enemies/wolf.dart';
import 'entite.dart';
import 'items/consummables/health_potion.dart';
import 'items/potion.dart';
import 'items/weapons/hammer.dart';
import 'joueur.dart';
import 'items/weapons/sword.dart';
import 'utils/combat_system.dart';
import 'utils/randomizer.dart';
import 'utils/tutorial_texts.dart';

void main(List<String> arguments) {
  Joueur joueur = Joueur.start("uwu", Classe.Warrior());
  joueur.equipWeapon(Sword(45, 1.2, 1));
  TutorialText.initGameText();
  List<Entite> wave = Randomizer.createEnemyWave(5);
  for (Entite enemy in wave) {
    CombatSystem combatSystem = CombatSystem(joueur, enemy);
    combatSystem.fight();
    if (!joueur.isAlive) {
      print("GAME OVER! Vous êtes mort :D");
      break;
    }
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
