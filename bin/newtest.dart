import 'classes/classe.dart';
import 'enemies/wolf.dart';
import 'items/consummables/health_potion.dart';
import 'items/potion.dart';
import 'items/weapons/hammer.dart';
import 'joueur.dart';
import 'items/weapons/sword.dart';
import 'utils/combat_system.dart';

void main(List<String> arguments) {
  Joueur joueur = Joueur.start("uwu", Classe.Warrior());
  joueur.inventory.addItem(HealthPotion.exilir());
  joueur.inventory.addItem(HealthPotion.standard());
  joueur.inventory.addItem(Hammer(10, 1.2, 10));
  joueur.inventory.addItem(HealthPotion.exilir());
  joueur.inventory.addItem(HealthPotion.exilir());
  joueur.inventory.addItem(Sword(100, 1.0, 1));
  Wolf wolf = Wolf(3);
  CombatSystem combat = CombatSystem(joueur, wolf);
  combat.fight();
  Wolf newWolf = Wolf(6);
  combat.opponent = newWolf;
  combat.fight();
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
