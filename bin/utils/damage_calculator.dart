import '../entities/entite.dart';
import '../items/weapons/weapon.dart';
import 'randomizer.dart';

class DamageCalculator {
  static int damageDone(Entite entite, Weapon weapon) {
    int damageDone;
    if (Randomizer.isEventTriggered(entite.critChance)) {
      print("Coup critique!");
      double damage = (weapon.damage * weapon.critMultiplier);
      damageDone = damage.round();
    } else {
      damageDone = weapon.damage;
    }
    return damageDone;
  }
}
